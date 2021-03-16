# TONEADE
## アプリケーション概要

TONEADE は 音楽理論や楽器の経験がない初心者でも、簡単なUI操作だけで、
ポピュラー音楽で必要とされる基礎的な音楽理論に則ったフレーズを自由に作成し公開できるアプリです。

<img width="1440" alt="スクリーンショット 2021-03-16 9 15 37" src="https://user-images.githubusercontent.com/52414882/111237791-219b0f00-8639-11eb-92e3-26f86d41a7a2.png">

<img width="360" alt="スクリーンショット 2021-03-16 9 25 49" src="https://user-images.githubusercontent.com/52414882/111238061-a84fec00-8639-11eb-8ac7-39f6879e7fa3.png">

[URL]
https://toneade.herokuapp.com/
トップページのテキストリンク「テストアカウントでログイン」から、メールアドレス、パスワードを入力せずにログインできます。

[アプリケーションwiki]
https://toneade.memo.wiki/

<!-- 本アプリケーションは工夫次第でそこそこ作曲ソフト的な使い方もできますが、あくまで気軽な作曲アイデアのスケッチ、作曲前の実験場的な使い方を想定したサービスです。  
メロディができたけどなかなか良いコード進行が浮かばない。ダイアトニックなコード進行から一歩捻った構成を探りたい。作りたい曲のキースケールのコードフォームを憶えていない。といった時に活用してください！

作成したフレーズはブログ形式で公開することができ、公開されているフレーズを「Nice!」することでそのフレーズを自身のフレーズに転用(Cover)することができます。
Coverを使用したフレーズは、オリジナル元へのリンクが作成されます。リスペクトは大切ですね！

自身が作成したフレーズ、またはNice!したフレーズは、MIDIファイルに書き出しを行うことができます。
DAWやシーケンサーにインポートして自身の創作活動にTONEADEを活用してください！

本格的なDAWやシーケンサーとしての機能は現在想定しておりません。素晴らしいDAWが世の中には沢山ありますので。  
ですが利用者の反応次第では機能の拡張を行なっていきたいと考えています。 -->

## 簡易操作説明
現在 Toneade は開発途中のため、機能限定のα版として動作しております。
ヘルプ機能、操作説明などはまだ未実装のため、フレーズ作成の操作は下記の画像をご参照ください。

[toneade操作説明](https://user-images.githubusercontent.com/52414882/69954663-2bc9f480-153f-11ea-83ae-25ef111a49e0.jpg)

<!--


## カタログ設計
[TONEADE-カタログ設計.pdf](https://github.com/roadfox303/toneade/files/3732917/TONEADE-.pdf)

## 機能一覧
[TONEADE-基本機能.pdf](https://github.com/roadfox303/toneade/files/3733608/TONEADE-.pdf)  
[TONEADE-フレーズ機能.pdf](https://github.com/roadfox303/toneade/files/3823482/TONEADE-.pdf)


## テーブル定義書
[TONEADE-テーブル定義.pdf](https://github.com/roadfox303/toneade/files/3732932/TONEADE-.pdf)

## ER図
![TONEADE_ER](https://user-images.githubusercontent.com/52414882/66912828-4e1ab800-f04e-11e9-8453-44cbdf34360d.png)

## 画面遷移図
![TONEADE_画面遷移](https://user-images.githubusercontent.com/52414882/66896977-fcb00000-f030-11e9-817a-46ba31e3ce0e.png)

## ワイヤーフレーム
[コード進行アプリ.pdf](https://github.com/roadfox303/toneade/files/3732947/default.pdf) -->

## 使用技術
- ruby 2.6.3
- rails 5.2.3
- postgresql 11
- Docker/Docker-compose
- circle CI

- Stripe

- devise
- gon
- cocoon
- RuboCop

- Tone.js
- Swiper
- modaal

## 機能一覧
- ユーザー登録/ログイン機能(Devise)
- コード進行作成
  - コード生成機能(自作ロジック javascript/jQuery)
  - コード判別機能(自作ロジック javascript/jQuery)
  - コード生成機能(自作ロジック javascript/jQuery)
  - フリック入力UI(自作ロジック javascript/jQuery)
  - 音源機能(Tone.js)
  - シーケンサー機能(Tone.js)
- 投稿機能
  - 画像投稿(CarrierWave)
- コメント機能
- フォロー機能
- いいね機能
- ページネーション機能(kaminari)
