# README

# PinPic

# アップロードした画像にピンを打ちテキストや画像を挿入することができます

# 開発者
```bash
 Yamafuku0717
```

# 開発環境
```bash
Ruby 2.6.5
Ruby on Rails 6.0.3.6
MySQL 5.6.51
Github
Visual Studio Code
```

# 接続先URL

```bash
https://pin-pic2.herokuapp.com/
```

# BASIC認証 ID/Pass

```bash
■ Id: yama
■ Pass: 0717
```

# テスト用アカウント等 
```bash
■ メールアドレス: TEST@example
■ パスワード: yama0717
```

# 制作背景
```bash
SNSの普及やスマートフォンのカメラ機能の向上で写真を撮る機会が以前より大幅に増えました
ただ写真を投稿するのではなく、情報を加えられたら表現の幅が広がるのではないかと考えた事が
制作のきっかけとなります
また、その際に直接テキストや画像を挿入してしまうと見辛いものになったり、修正が出来ない
といった課題があったため、立てたピンにカーソルを合わせると挿入された情報が閲覧できる、
クリックすることで編集ができるという機能を持ったアプリを開発することにしました
```

# 利用方法
```bash
■ 画像を投稿する
 ・トップページ左の「新規投稿」リンクより新規の画像を投稿
 ・投稿が完了すると、詳細ページに遷移し、画像に対してクリックする事でピンを立てる事ができるようになります
 ・画像をクリックすると💡が配置され、ページ右側にフォームが表示されますのでそちらで
   挿入するテキストや画像を投稿していただけます
 ・初期状態では画像が非公開になっていますので、公開したい場合、「公開」にチェックを入れて
  「変更」ボタンをクリックして下さい
 ・ピンをクリックするとリンク先で挿入された情報の編集・削除が出来ます
  
  ※テキスト・画像の挿入は投稿者のみ行うことが出来ます
```
※新規投稿<br>
![Image](https://media.giphy.com/media/5xuC8ZBy1L36yw32Bf/giphy.gif)<br>
※テキスト挿入<br>
![Image](https://media.giphy.com/media/GjiZGFE7lpxrj4L9fk/giphy.gif)

```bash  
■ 投稿された画像を閲覧する
 ・トップページに表示された画像をクリックすると詳細ページに遷移します
 ・画像にピンが立ててある場合、カーソルを合わせることで挿入されたテキストや画像がふきだし状で表示されます
   また、「ふきだしを表示」ボタンをクリックする事で常に表示された状態となります
 ・表示されたふきだし同士が重なっている場合は、ドラッグによって移動させる事が出来ます
 ・ピンを直接クリックすると挿入されたテキストや画像の詳細ページに遷移します
```
![Image from Gyazo](https://i.gyazo.com/3c64ef3c7c4b9f4f382dd1fe0f09f299.gif)

```bash
■ 非公開機能
 ・投稿したユーザーのみ画像が閲覧できる機能
 ・マイページの「非公開画像を表示」ボタンをクリックすることで一覧となって表示されます
 ・公開前の確認用や、自分用にメモを残したり、学習にお使いいだだくことも出来ます
```
![Image from Gyazo](https://i.gyazo.com/09d86381ced899e860db999eb5b1000d.gif)
 

# 工夫点
 
```bash
開発初期ではピンを立てる位置を絶対値(座標)で指定していたため、画面のサイズが変わると
ピンが画像に追従せず、想定通りの挙動になりませんでした
そこで、ピンの位置を画像サイズに対する割合で指定することで画面サイズの変更に対応できるようにしました
また、非公開機能を実装したことで自分に向けた資料の作成や、学習、趣味に使用できるようになりました
```
 
# 課題や今後実装したい機能
 
```bash
■ 課題
・マイページにおける画像の管理
  現在、マイページにおいて画像を選択する際はスクロールして確認する必要があるため、
  目的の画像を見つけ難い状態です
  投稿した日付毎や任意のディレクトリを作成し、収納できる機能を検討中です
 
・herokuによるデプロイでCSSが適用されていない部分がある点の対策
  ローカル環境と本番環境とで表示が異なっている点
 
・ユーザー同士の繋がりが薄い点
  現状ですと投稿された画像の閲覧のみで完結してしまうため、ユーザー間での繋がりが生まれません
  長くアプリを使用してもらうために投稿の励みになる機能や、特典などを付与したいと考えています
  
■ 今後実装したい機能
・タグ付け機能
・お気に入り機能
・いいね機能
・いいね獲得数ランキング機能
・コメント機能
・ふきだしへの動画挿入機能
・ふきだし内での複数画像挿入機能
・条件検索機能
・ユーザー検索機能
・マイページにおける画像管理機能

```

## usersテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|nickname          |string     |null: false               |
|email             |string     |unique: true, null: false |
|password          |string     |null: false               |

### Association
has_many :pictures

<br>

## picturesテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|text              |string     |null: false               |
|user              |references |foreign_key :true         |
|public_private    |string     |null: false               |

### Association
has_many :memos, dependent: :destroy
<br>belongs_to :user

<br>

## memosテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|info              |text       |                          |
|picture           |references |foreign_key :true         |
|offsetX           |float      |null: false               |
|offsetY           |float      |null: false               |

### Association
belongs_to :picture