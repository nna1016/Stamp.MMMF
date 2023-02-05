# MMMF_Stamp
## 各バージョン
| 名前 | バージョン |
| ---- | ---- |
| Ruby  | 2.6.6p146 |
| Rails | Rails 6.1.4.1 |
| bundler | 2.2.32 |
| MySQL | 5.7 (開発環境はこれ以上なら問題ナシ) | 
| yarn | 1.22.15 |
| node | v16.13.0 |

## 最初にやること

1. リポジトリのクローン   
`git clone git@github.com:nna1016/MMMF_Stamp.git`
2. データベース設定ファイルの設定  
config直下にdatabase.ymlを置いて、database.ymlのユーザーネームとパスワードを変更  
(database.ymlは`\Act共有サーバー\10.システム部\Rails系`に置いてある)
3. app直下に `.env`を追加する 
4. 下記のAWS関連のgemを全てコメントアウトした後に `bundle install`
```
#AWS用unicorn
group :production, :staging do
    gem 'unicorn', '6.0.0'
end
group :development, :staging do
    gem 'unicorn', '6.0.0'
end
#'AWS - JSエラー回避'
gem 'mini_racer',       '~> 0.3.1'
```

5. `rails db:create`  
6. `rails db:migrate`
7. `rails webpacker:install`  
8. `rails webpacker:compile`

この後に `rails s` が実行出来たらOK

## 注意事項
開発環境だとユーザー登録時のメール認証がめんどくさいので、登録してメール認証のメールが来たら  
 `update users set confirmed_at = now(), role_flag = {1 ~ 5の権限} where student_no = "学籍番号";`  
 で認証と権限付与できる。
