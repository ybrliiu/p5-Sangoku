# NEO三国志NET
CGIゲーム三国志NETを新しく作りなおしたゲームです。  

# next
```      

* 未読がわかるように
 - どこまで読んだかを手紙IDで記録する個人専用データ作成(Record) [完了]
 - 手紙のタブ化...?


* 個人宛手紙、mypageに履歴から送信追加、手紙ログ

* Model::Site 月をまたがる場合や年をまたがる場合は？

* country_position, town country_name SQL見なおす

* t/ テストするモジュールのload部分をload関数に
* js, scss 外部ファイル化, head読み込みシステム

* primary_key を参照するメソッド、modelにあるべきかrowにあるべきか...
  (record系と統一させるならrowにあるべき？, 両方あってもいいような気が)

* plugin -> web 名前空間へ？
* web.pm の処理 外部ファイルに切り出し
* SQLのチューニング
* 書いてないテストも書きましょうね〜〜
* testのコード共通化進める?
* Rowオブジェクトの処理共通化(かなり難しいのでよく考えて)
* outer/regist/complete-regist リロードされた時どうするか
* ログイン時のcookie を暗号化
* チャット部分のとコマンド部分、なんか汚い
時間あればより良い方法を考える

```

# 環境設定方法
```
1. 外部環境設定
2. 依存Perlモジュールインストール
3. 設定ファイル記述(etc/config/db.conf, NYTProf.conf, (Site.conf))
4. perl script/setup.pl
```
