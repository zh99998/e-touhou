require 'devise/strategies/authenticatable'
module Devise
  module Strategies
    # Default strategy for signing in a user, based on his email and password in the database.
    class UcenterAuthenticatable < Authenticatable
      def authenticate!
        p 1
        result = Ucenter.user_login(authentication_hash[:email], password)
        p result[0]
        case result[0].to_i
        when -1
          fail!(-1)
        when -2
          fail!(-2)
        when -3
          fail!(-3)
        else
          resource = User.find_or_create_by_id(result[0])
          resource.password = result[2]
          resource.update_attributes(name: result[1], email: result[3])
          success!(resource)
        end
      end
    end
  end
end

Warden::Strategies.add(:ucenter_authenticatable, Devise::Strategies::UcenterAuthenticatable)
