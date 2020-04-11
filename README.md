# カフェの投稿サイト
<img width="1440" alt="スクリーンショット 2020-04-11 17 11 10" src="https://user-images.githubusercontent.com/48595835/79038836-85da7500-7c17-11ea-93f7-b842d416e21b.png">

## 機能

* ユーザー関連
  * ユーザー認証
  * フォロー機能(フォローしたユーザーの投稿を表示)
  * ユーザーごとに投稿した地域一覧を表示
  * オススメ店を登録
  
* 店舗関連
  * 店舗情報を登録
  * 登録された住所からGoogle Mapによる位置表示
  * 地域、店名から店舗検索

* 投稿
  * 新規投稿、編集、削除
  * 投稿に対するコメント、お気に入り
  * 地域、店舗ごとに投稿表示  

* ページネーション機能

## 技術

* 言語・・・HTML, CSS, Ruby, JavaScript

* フレームワーク,ライブラリ・・・Ruby on Rails, Bootstrap, jQuery

* データベース・・・MySQL
  
* デプロイサーバ・・・AWS(EC2, RDS, Route53), Nginx, Puma

* 外部API・・・Google Map API

* 機能面での使用gem 
  * ユーザー認証・・・devise
  * 画像アップロード・・・refile, refile-mini_magick
  * Map表示・・・geocoder
  * フォント表示・・・font-awesome-sass
  * ページネーション・・・kaminari
