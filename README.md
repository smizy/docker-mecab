# docker-mecab

[MeCab](http://taku910.github.io/mecab/) docker image based on alpine


## Usage

```
$ echo "MeCabは 京都大学情報学研究科−日本電信電話株式会社コミュニケーション科学基礎研究所 共同研究ユニットプロジェクトを通じて開発されたオープンソース 形態素解析エンジンです。" \
 | docker run --rm -i -a STDIN -a STDOUT smizy/mecab:0.996-alpine 
MeCab	名詞,固有名詞,一般,*,*,*,MeCab,メカブ,メカブ
は	助詞,係助詞,*,*,*,*,は,ハ,ワ
京都大	名詞,固有名詞,組織,*,*,*,京都大,キョウトダイ,キョートダイ
学	名詞,接尾,一般,*,*,*,学,ガク,ガク
情報学研究科	名詞,固有名詞,一般,*,*,*,情報学研究科,ジョウホウガクケンキュウカ,ジョーホーガクケンキューカ
−	記号,一般,*,*,*,*,−,ヒク,ヒク
日本電信電話株式会社	名詞,固有名詞,組織,*,*,*,日本電信電話,カブシキガイシャ,カブシキガイシャ
コミュニケーション	名詞,一般,*,*,*,*,コミュニケーション,コミュニケーション,コミュニケーション
科学	名詞,一般,*,*,*,*,科学,カガク,カガク
基礎	名詞,一般,*,*,*,*,基礎,キソ,キソ
研究所	名詞,一般,*,*,*,*,研究所,ケンキュウジョ,ケンキュージョ
共同	名詞,サ変接続,*,*,*,*,共同,キョウドウ,キョードー
研究	名詞,サ変接続,*,*,*,*,研究,ケンキュウ,ケンキュー
ユニット	名詞,一般,*,*,*,*,ユニット,ユニット,ユニット
プロジェクト	名詞,一般,*,*,*,*,プロジェクト,プロジェクト,プロジェクト
を通じて	助詞,格助詞,連語,*,*,*,を通じて,ヲツウジテ,ヲツージテ
開発	名詞,サ変接続,*,*,*,*,開発,カイハツ,カイハツ
さ	動詞,自立,*,*,サ変・スル,未然レル接続,する,サ,サ
れ	動詞,接尾,*,*,一段,連用形,れる,レ,レ
た	助動詞,*,*,*,特殊・タ,基本形,た,タ,タ
オープンソース	名詞,固有名詞,一般,*,*,*,Open Source,オープンソース,オープンソース
形態素解析	名詞,固有名詞,一般,*,*,*,形態素解析,ケイタイソカイセキ,ケイタイソカイセキ
エンジン	名詞,一般,*,*,*,*,エンジン,エンジン,エンジン
です	助動詞,*,*,*,特殊・デス,基本形,です,デス,デス
。	記号,句点,*,*,*,*,。,。,。
EOS 
```