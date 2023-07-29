# TODO: encrypt the github_access_token attribute
class User < ApplicationRecord
  validates :github_uid, uniqueness: true # presence is not mandatory to allow non-GH fixtures)
  
  def self.from_omniauth(auth_data)
    User
      .create_with(email: auth_data.info.email, name: auth_data.info.name)
      .find_or_create_by(github_uid: auth_data.uid)
      .tap { |u| u.update github_access_token: auth_data.credentials.token }
  end
end
