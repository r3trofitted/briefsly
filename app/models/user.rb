# TODO: encrypt the github_access_token attribute
class User < ApplicationRecord
  has_many :slots, dependent: :destroy

  has_many :hosting_jams, through: :slots, class_name: "Jam", source: :jam
  has_many :guesting_jams, as: :guest, class_name: "Jam"

  validates :github_uid, uniqueness: true # presence is not mandatory to allow non-GH fixtures)

  # TODO: fuzzy search
  scope :by_buddyname, ->(name) { where(name: name).or(where(github_nickname: name)) }

  def self.from_omniauth(auth_data)
    User
      .create_with(email: auth_data.info.email, name: auth_data.info.name, github_nickname: auth_data.info.nickname)
      .find_or_create_by(github_uid: auth_data.uid)
      .tap { |u| u.update github_access_token: auth_data.credentials.token }
  end
end
