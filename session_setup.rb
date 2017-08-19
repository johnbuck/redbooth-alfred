require 'redbooth-ruby'
require 'json'
require 'pry'
require '~/Desktop/redbooth_env'

def redboothInit
    RedboothRuby.config do |configuration|
      configuration[:consumer_key] = AuthVars::Client_id
      configuration[:consumer_secret] = AuthVars::Client_secret
    end

    # By default, your access token will expires in 7200 seconds (2 hours). If you want to automatically get a new one, just need to provide the refresh_token param
    # todo: refreshing the token dynamically doesn't seem to be working, fix it!!
    session = RedboothRuby::Session.new(
      token: AuthVars::Token,
      refresh_token: AuthVars::Refresh_token,
      auto_refresh_token: true,
      on_token_refresh: Proc.new do |old_access_token, new_access_token|
        auth = Authentication.where(access_token: old_access_token.token).first
        auth.access_token = new_access_token.token
        auth.refresh_token = new_access_token.refresh_token
        auth.save
      end
    )
    return RedboothRuby::Client.new(session)
end
