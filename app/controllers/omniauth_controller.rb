class OmniauthController < ApplicationController

def facebook
 @account = Account.create_from_provider_data(request.env['omniauth.auth'])
 if @account.persisted?
   sign_in_and_redirect @account

 else
   flash[:error] = 'There was a problem signig you in through Facebook!?'
   redirect_to new_account_registration_url
 end
end

def github
 @account = Account.create_from_github_data(request.env['omniauth.auth'])
 if @account.persisted?
   sign_in_and_redirect @account

 else
   flash[:error] = 'There was a problem signig you in through Github!?'
   redirect_to new_account_registration_url
 end
end

def google_oauth2
 @account = Account.create_from_google_data(request.env['omniauth.auth'])
 if @account.persisted?
   sign_in_and_redirect @account
   
 else
   flash[:error] = 'There was a problem signig you in through Google!?'
   redirect_to new_account_registration_url
 end
end

def failure
  flash[:error] = 'There was a problem signig you in!'
  redirect_to new_account_registration_url
end

end
