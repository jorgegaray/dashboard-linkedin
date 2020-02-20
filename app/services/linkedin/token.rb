class Linkedin::Token
    extend CallableCommand
    require 'oauth2'
    
    def initialize
    end
  
    def call
      consume_post
      #client = OAuth2::Client.new('789hdevfb6tae5', 'DcShia8nVeRez3KP', :site => 'https://www.linkedin.com/oauth/v2/accessToken')
      #client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/companies/linkedin_token')    
    end


    def consume_post
      uri = URI.parse("https://www.linkedin.com/oauth/v2/accessToken")
      header = {'Content-Type': 'application/x-www-form-urlencoded'}
      request = Net::HTTP::Post.new(uri.request_uri, header)

      request.set_form_data(
        "client_id" => "789hdevfb6tae5",
        "client_secret" => "DcShia8nVeRez3KP",
        "grant_type" => "client_credentials"
      )
  
      req_options = {
        use_ssl: uri.scheme == "https",
        verify_mode: OpenSSL::SSL::VERIFY_NONE
      }
  
      retries = 3
      http_response = ''
      byebug
      while retries > 0
        Rails.logger.debug "#{retries} retries left"
        http_response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
          # Send the request
          http.request(request)
        end
        byebug
        if http_response.is_a? Net::HTTPSuccess
          Rails.logger.info "Successful response: #{http_response.code} #{http_response.body}"
          return http_response.body
        end
        Rails.logger.info "Response failed: #{http_response.code} #{http_response.body}"
  
        retries -= 1
      end
      raise Error.new("Error desde el Servidor. Codigo: " + http_response.code + ", Cuerpo: " + http_response.body) if retries < 1
    rescue SocketError
      raise Error.new "No es posible conectarse al endpoint configurado"
    end
  end