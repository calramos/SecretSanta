OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = UsersController.action(:oauth_failure)

Rails.application.config.middleware.use OmniAuth::Builder do
  #Removed for Github
end
