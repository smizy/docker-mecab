FROM alpine:3.4
MAINTAINER smizy

ENV MECAB_VERSION   0.996
ENV IPADIC_VERSION  2.7.0-20070801
ENV mecab_url       https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7cENtOXlicTFaRUE
ENV ipadic_url      https://drive.google.com/uc?export=download&id=0B4y35FiV1wh7MWVlSDBCSXZMTXM

RUN set -x \
    && apk add --update --no-cache \
        bash \
        ca-certificates \
        libstdc++ \
        su-exec \
        wget \
    && apk --no-cache add --virtual .builddeps \
        build-base \
        curl \
        file \
        git \
        openssl \
        sudo \
    && CPUCOUNT=$(getconf _NPROCESSORS_ONLN)  \
    # Install MeCab
    && wget -q -O - ${mecab_url} \
        | tar -xzf - -C /tmp \
    && cd /tmp/mecab-[0-9]* \
    && ./configure --enable-utf8-only --with-charset=utf8 \
    && make  -j ${CPUCOUNT} \
    && make install \
    # Install IPA dic
    && wget -q -O - ${ipadic_url} \
        | tar -xzf - -C /tmp \
    && cd /tmp/mecab-ipadic-* \
    && ./configure --with-charset=utf8 \
    && make  -j ${CPUCOUNT} \
    && make install \
    # Install Neologd
    && cd /tmp \
    && git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
    && mecab-ipadic-neologd/bin/install-mecab-ipadic-neologd -n -y \
    # Clean up
    && apk del .builddeps \
    && rm -rf \
        /tmp/mecab-[0-9]* \
        /tmp/mecab-ipadic-* \
        /tmp/mecab-ipadic-neologd \
    ## user/dir/permmsion
    && adduser -D  -g '' -s /sbin/nologin -u 1000 docker \
    && adduser -D  -g '' -s /sbin/nologin mecab 

COPY entrypoint.sh  /usr/local/bin/
    
ENTRYPOINT ["entrypoint.sh"]

CMD ["mecab", "-d", "/usr/local/lib/mecab/dic/mecab-ipadic-neologd"]