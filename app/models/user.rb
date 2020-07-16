class User < ApplicationRecord
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
    def from_github(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.data = auth

        user.username = auth.info.nickname
        user.name = auth.info.name
        user.email = auth.info.email
        user.avatar_url = auth.info.image
      end
    end
  end
end
