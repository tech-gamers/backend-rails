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
    def from_github(data, user: nil)
      where(provider: data.provider, uid: data.uid).first_or_create! do |auth|
        auth.user = user
        auth.provider = data.provider
        auth.uid = data.uid

        auth.username = data.info.nickname
        auth.name = data.info.name
        auth.email = data.info.email
        auth.avatar_url = data.info.image
      end
    end
  end

  belongs_to :user, optional: true

  before_validation lambda {
    self.user = User.create!(name: name, avatar_url: avatar_url)
  }, if: -> { !user_id }

  validates :user_id, presence: true
end
