LinkedIn.configure do |config|
  config.client_id     = '789hdevfb6tae5'
  config.client_secret = 'DcShia8nVeRez3KP'
  config.scope = 'r_liteprofile w_member_social'

  # This must exactly match the redirect URI you set on your application's
  # settings page. If your redirect_uri is dynamic, pass it into
  # `auth_code_url` instead.
  config.redirect_uri = "http://localhost:3000/companies/linkedin_token"
end
