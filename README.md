# sibatora
Rack's Learning Repository

## 使い方

- リポジトリをクローン
- gem のインストール
- rackup を実行
```
git clone https://github.com/ot0m1/sibatora.git
cd Shibatora
bundle install
rackup
```

rackup コマンドを実行して成功した場合、以下のようなログが表示されます。

```
Puma starting in single mode...
* Puma version: 5.2.2 (ruby 3.0.0-p0) ("Fettisdagsbulle")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 22469
* Listening on http://127.0.0.1:9292
* Listening on http://[::1]:9292
Use Ctrl-C to stop
```

ブラウザで `http://127.0.0.1:9292` にアクセスしてください。

- フォームに入力した文字列が post され表示されます
- フォームに URL を入力した場合、ミドルウェアとして簡易ウェブアプリケーションファイアウォールが実行され 403 のレスポンスコードと警告文が表示されます


curl コマンドでもブラウザと同じ挙動を確認できます。

```
curl http://127.0.0.1:9292/ -X POST -d 'hello' -i
HTTP/1.1 200 OK
Content-Type: text/html;charset=utf-8
Content-Length: 31

<html><body>hello</body></html>%
```

```
curl http://127.0.0.1:9292/ -X POST -d 'https://example.com' -i
HTTP/1.1 403 Forbidden
Content-Type: text/html;charset=utf-8
Content-Length: 68

<html><body>URLを含む文章は投稿できません</body></html>%
```
