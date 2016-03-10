class User < ActiveRecord::Base
	def self.from_omniauth(auth)
    #where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
		#debugger
    #where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		user = User.find_by_email(auth.info.email)

		if !user
			user = User.new
	    user.provider = auth.provider
	    user.uid = auth.uid
			user.email = auth.info.email
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save
		end

		return user

  end


end
