class ApplicationController < ActionController::Base
  before_action  :authenticate_user!

  rescue_from Exception, with: :error_500 unless Rails.env.development?

  rescue_from AbstractController::ActionNotFound, with: :error_404 unless Rails.env.development?
  rescue_from ActionController::RoutingError, with: :error_404 unless Rails.env.development?
  rescue_from ActiveRecord::RecordNotFound, with: :error_404 unless Rails.env.development?

  def error_500
    render file: "#{Rails.root}/public/500.html", layout: false, status: 500
  end

  def error_404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

  def after_sign_out_path_for(resource)
    new_user_session_path 
  end
end
