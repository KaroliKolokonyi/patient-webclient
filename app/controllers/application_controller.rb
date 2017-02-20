class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action  :access_restriction 

 def access_restriction 
     authenticate_or_request_with_http_token do |key, options|
      User.find_by(email: request.headers['X-User-Email'], key: key)
    end 
end 

  
end
