class Home < ApplicationRecord
  has_many :users
  has_many :tasks
  has_secure_token :invitation_token
end
