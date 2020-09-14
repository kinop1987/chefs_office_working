# README

<h1 align="center">調理場用業務管理アプリ</h1>

## アプリケーション概要
* 調理場内での発注管理や原価計算、メモ機能を備えた個人アプリです。
* 作成期間： 2020/9/1 〜 2020/9/14
* - ![top_page](https://user-images.githubusercontent.com/63842526/91662432-5623ff00-eb1d-11ea-8340-93c87434efcd.png)

### ■ IPアドレス
* 18.180.241.33

### ■ テストユーザー
#### 発注者 
- メールアドレス:  kaisen@gmail.com
- パスワード: kaisen
#### 受注者
- メールアドレス: yaoya@gmail.com
- パスワード: yaoyayaoya

## 機能一覧
- ログイン登録、新規登録機能（発注者側、受注者側で別に行えます）。
#### 発注者
- 商品注文機能
- 原価計算機能
- メモ投稿機能
- 伝票確認機能
- 棚卸機能
- レシピ投稿機能
#### 受注者
- 商品出品機能（複数の商品を一括登録できます）
- 注文確認機能
- 伝票作成機能



## 主な使用技術
<a><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /></a> <!-- RubyOnRailsのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774618-b32edb80-2fb5-11ea-9050-d5929a49e9a5.png" height="60px;" /></a> <!-- Hamlのロゴ -->
<a><<img src="https://user-images.githubusercontent.com/39142850/71774644-115bbe80-2fb6-11ea-822c-568eabde5228.png" height="60px" /></a> <!-- Scssのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774768-d064a980-2fb7-11ea-88ad-4562c59470ae.png" height="65px;" /></a> <!-- jQueryのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774786-37825e00-2fb8-11ea-8b90-bd652a58f1ad.png" height="60px;" /></a> <!-- AWSのロゴ -->
### ■ 言語

#### バックエンド
* Ruby 6.0.3.2

#### フロントエンド
* Haml 5.1.2
* Sass 3.7.4
* jquery-rails 4.4.0

### ■ フレームワーク
* Ruby on Rails 6.0.3.2

### ■ データベース
* MySQL 8.0

### ■ インフラ
* AWS EC2
* AWS S3
* Docker 19.03.12


### ■ デプロイ
* Capistranoによる自動デプロイ

## :globe_with_meridians: インストール方法
1.このリポジトリを複製<br>
`$ git clone https://github.com/kinop1987/chefs_office_workingk`

2.インストールしたリポジトリに移動<br>
`$ cd chefs_office_working`

3.gemをアプリケーションに適用<br>
`$ bundle install`<br>

4.DBの作成&反映<br>
`$ rails db:create`<br>
`$ rails db:migrate`<br>

5.カテゴリ一覧の反映<br>
`$ rails db:seed`<br>

6.アプリケーションの起動<br>
`$ rails s`<br>
:point_right:`http://localhost:3000`
