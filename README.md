# README

# PinPic

## アップロードした画像にピンを打ちテキストや画像を挿入することができます。
 
## 接続先URL
  https://pin-pic2.herokuapp.com/

## BASIC認証 ID/Pass
  ■ Id: yama
  ■ Pass: 0717
 
## テスト用アカウント等 
  ■ メールアドレス: TEST@example
  ■ パスワード: yama0717

## 制作背景
  画像に
 
## 利用方法
  ■ 画像を投稿する
   トップページ左の「新規投稿」リンクより新規の画像を投稿
   投稿が完了すると、詳細ページに遷移し、画像に対してクリックする事でピンを刺す事ができるようになります
   画像をクリックすると💡が配置され、ページ右側に入力フォームが表示されますのでそちらで
   挿入するテキストや画像を投稿していただけます
   初期状態では画像が非公開になっていますので、公開したい場合、「公開」にチェックを入れて「変更」ボタンをクリックして下さい
   また、ピンをクリックしたリンク先で挿入された情報の編集・削除が出来ます
  
  ■ 投稿された画像を閲覧する
   トップページに表示された画像をクリックすると詳細ページに遷移します
   画像にピンが刺してある場合、カーソルを合わせることで挿入されたテキストや画像がふきだし状で表示されます
   また、「ふきだしを表示」ボタンをクリックする事で常に表示された状態となります。表示されたふきだし同士が重なっている場合は、
   ドラッグによって移動させる事が出来ます
   ピンを直接クリックすると挿入されたテキストや画像の詳細ページに遷移します

 
![Image from Gyazo](https://i.gyazo.com/189230d794a7d3f608c8147411ab8d05.gif)

![Image from Gyazo](https://i.gyazo.com/3c64ef3c7c4b9f4f382dd1fe0f09f299.gif)

![Image from Gyazo](https://i.gyazo.com/09d86381ced899e860db999eb5b1000d.gif)
 
# Installation
 
Requirementで列挙したライブラリなどのインストール方法を説明する
 
```bash
pip install huga_package
```
 
# Usage
 
DEMOの実行方法など、"hoge"の基本的な使い方を説明する
 
```bash
git clone https://github.com/hoge/~
cd examples
python demo.py
```
 
# Note
 
注意点などがあれば書く
 
# Author
 
作成情報を列挙する
 
* 作成者
* 所属
* E-mail
 
# License
ライセンスを明示する
 
"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).
 
社内向けなら社外秘であることを明示してる
 
"hoge" is Confidential.

## usersテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|nickname          |string     |null: false               |
|email             |string     |unique: true, null: false |
|password          |string     |null: false               |

### Association
has_many :pictures


## picturesテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|text              |string     |null: false               |
|user              |references |foreign_key :true         |
|public_private    |string     |null: false               |

### Association
has_many :memos, dependent: :destroy
belongs_to :user


## memosテーブル

|column            |Type       |Options                   |
|------------------|-----------|--------------------------|
|info              |text       |                          |
|picture           |references |foreign_key :true         |
|offsetX           |float      |null: false               |
|offsetY           |float      |null: false               |

### Association
belongs_to picture