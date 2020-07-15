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
    def from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.name = auth.info.name
        user.uid = auth.uid
        user.email = auth.info.email
      end
    end
  end
end
