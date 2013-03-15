class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end

module User::Ucenter
  require 'net/http'
  Wrapper = 'http://ucenter-wrapper.e-touhou.my-card.in/index.php'

  class <<self
    def method_missing(method, *args)
      #res = Net::HTTP.post_form(Wrapper, 'action' => method, 'parameters' => args.to_json)
      uri = URI(Wrapper)
      uri.query = URI.encode_www_form('action' => method, 'parameters' => args.to_json)
      res = Net::HTTP.get_response(uri)
      logger.info('ucenter response'){res.body}
      puts res.body
      if res.body == 'null'
        nil
      else
        JSON.parse res.body
      end
    end
  end
end
