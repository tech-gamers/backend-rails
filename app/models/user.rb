class User < ApplicationRecord
  has_many :auths, dependent: :destroy
end
