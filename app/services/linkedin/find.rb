class Linkedin::Find
  extend CallableCommand
  require 'oauth2'

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    client = OAuth2::Client.new('789hdevfb6tae5', 'DcShia8nVeRez3KP', :site => 'https://www.linkedin.com/oauth/v2/accessToken')
    client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/')
    # => "https://example.org/oauth/authorization?response_type=code&client_id=client_id&redirect_uri=http://localhost:8080/oauth2/callback"
    
    token = client.auth_code.get_token('authorization_code_value', :redirect_uri => 'http://localhost:3000/companies/find_linkedin', :headers => {'Authorization' => 'Basic some_password'})
    response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
    response.class.name
  end
end