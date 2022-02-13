class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :image, :password, :description, :website])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email, :password])

  end

  def current_user
    session[:user_id] = current_user.id
  end

  def self.render_with_signed_in_user(account, *args)
   ActionController::Renderer::RACK_KEY_TRANSLATION['warden'] ||= 'warden'
   proxy = Warden::Proxy.new({}, Warden::Manager.new({})).tap{|i| i.set_account(account, scope: :account, run_callbacks: false) }
   renderer = self.renderer.new('warden' => proxy)
   renderer.render(*args)
 end

end
