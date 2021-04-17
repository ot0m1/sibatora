# frozen_string_literal: true

require 'uri'

class ShibatoraWaf
  def initialize(app)
    @app = app
  end

  def call(env)
    response = @app.call(env)
    if env['REQUEST_METHOD'] == 'POST'
      response[2] = response[2].map do |body|
        decode_body = URI.decode_www_form_component(body)
        if decode_body.match?(%r{https?://[\w/:%#{Regexp.last_match(0)}?()~.=+\-]+})
          return [
            403,
            { 'Content-Type' => 'text/html;charset=utf-8' },
            ['<html><body>URLを含む文章は投稿できません</body></html>']
          ]
        else
          decode_body
        end
      end
    end
    response
  end
end
