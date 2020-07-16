class Auth < ApplicationRecord
  devise :database_authenticatable,
         # to provide sessions
         :lockable,
         :omniauthable,
         # OAuth
         :rememberable,
         :registerable,
         :timeoutable,
         :trackable # allow signing up new users

  class << self
    def from_github(data)
      where(provider: data.provider, uid: data.uid).first_or_create do |auth|
        auth.provider = data.provider
        auth.uid = data.uid
        auth.data = data

        auth.username = data.info.nickname
        auth.name = data.info.name
        auth.email = data.info.email
        auth.avatar_url = data.info.image
      end
    end
  end
end
