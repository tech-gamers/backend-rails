class User < ApplicationRecord
  devise :lockable, :omniauthable, :rememberable, :trackable
end
