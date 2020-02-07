class CustomAuthenticationFailure < Devise::FailureApp 
  protected 
    def redirect_url 
      errors_path
    end 
  end 