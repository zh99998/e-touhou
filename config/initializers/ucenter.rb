module Ucenter
  require 'net/http'
  Wrapper = 'http://ucenter-wrapper.e-touhou.my-card.in/index.php'

  class <<self
    def method_missing(method, *args)
      puts method
      #res = Net::HTTP.post_form(Wrapper, 'action' => method, 'parameters' => args.to_json)
      uri = URI(Wrapper)
      uri.query = URI.encode_www_form('action' => method, 'parameters' => args.to_json)
      res = Net::HTTP.get_response(uri)
      puts res.body
      if res.body == 'null'
        nil
      else
        JSON.parse res.body
      end
    end
  end
end
