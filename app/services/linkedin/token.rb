class Linkedin::Token
    extend CallableCommand
    
    def initialize
    end
  
    def call
      @oauth = ::LinkedIn::OAuth2.new
    end

    def publish code, message, url
      @oauth.auth_code_url
      access_token = @oauth.get_access_token code
      api = LinkedIn::API.new(access_token)
      profile = api.profile
    end

    
  end