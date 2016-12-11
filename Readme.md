# NEO三国志NET
CGIゲーム三国志NETを新しく作りなおしたゲームです。  

# next
```      

* 会議室
 = SCSSファイル生成部分
 = navigate btn
 = page
 = 再編集用のタグ再置換ヘルパー定義

* navigate button 修正
* conference -> conference-room

* フォーラム
* 都市滞在一覧
* 国法
* 司令部

* 継承したほうが適切な場合は継承させる

* スキルクラス考える
* コマンド実行部分考える
* コマンド作成

* アイコンアップローダ
* 
* 雑談BBS

* mypage map 都市クリックしたらその都市の情報を表示

* t/ テストするモジュールのload部分をload関数に

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
* チャット部分(model-addmethod, 共通化)とコマンド部分(input, choose-select混合部)、なんか汚い

```

# バグ
```
* icon-list 新規ウィンドウで開けばいつでも「アイコンを選択してください」とでてくる
```

# 環境設定方法
```
1. 外部環境設定
2. 依存Perlモジュールインストール
3. 設定ファイル記述(etc/config/db.conf, NYTProf.conf, (Site.conf))
4. perl script/setup.pl
```
