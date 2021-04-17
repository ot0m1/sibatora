# frozen_string_literal: true

class Shibatora
  def call(env)
    posted_content = env['rack.input'].gets.gsub(/my_form=/, '') if env['REQUEST_METHOD'] == 'POST'

    case env['REQUEST_METHOD']
    when 'GET'
      [
        200, # ステータスコード
        { 'Content-Type' => 'text/html;charset=utf-8' }, # Hash のレスポンスヘッダ
        ['<html>
            <body>
              <form method="POST">
                <textarea name="my_form" style="width:300px;height:80px;display:block;margin-bottom:10px;"></textarea>
                <input type="submit" value="送信する" />
              </form>
            </body>
          </html>'] # Array のレスポンスボディ
      ]
    when 'POST'
      [
        200, # ステータスコード
        { 'Content-Type' => 'text/html;charset=utf-8' }, # Hash のレスポンスヘッダ
        ["<html><body>#{posted_content}</body></html>"] # Array のレスポンスボディ
      ]
    end
  end
end
