class User < ActiveRecord::Base
  has_secure_password
  has_many :snowboards
  has_many :addons, through: :snowboards
end
