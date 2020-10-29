# TechBook

"TechBook" はエンジニア同士がおすすめの本を共有するためのサイトです。

# DEMO

![](https://raw.github.com/wiki/nebokecat/Techbook/images/CRUD.gif)
![](https://raw.github.com/wiki/nebokecat/Techbook/images/favo_follow.gif)
and more,please wait...

# 機能一覧

- devise gemとtwitterAPIを用いたログイン機能
  - テスト用アカウントは以下になります
   - name: test
   - email: test@test
   - password: "aaaaaa"
- いいね機能でお気に入りの投稿を保存。フォローでお気に入りの人物を追い続けることができます。
- コメント機能で投稿に対してコメントもできます。

# 注力した部分

- includesを用いてSQL文を極力減らしました
- いいね、コメント、フォロー部分はAjaxで作りました。
- レイアウトを最低限整えるためにBootstrapを用いてわからない
- 実装中のindex表示のSQL文があまりに多く表示されるのが気になりincludesメソッドやページネーションを用いて少なくなるよう意識しました。

# 環境
- cloud9
- Ruby 2.6.3
- Rails 5.2.4.4

# 環境構築手順
- 手元にRailsの環境がある場合
  - cloneしていただき、ターミナルで
```
    bundle install --without production
    rails db:migrate
    rails db:seed
    rails s
```
でローカル環境で実行することができます

# これから

こちらはまだ未完成です。これから
- タグ機能
- 通知機能
- APIを用いた書籍検索機能
などを実装していきたいと思っています。
