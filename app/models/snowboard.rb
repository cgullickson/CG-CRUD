class Snowboard < ActiveRecord::Base
  belongs_to :user
  has_many :addons
end
