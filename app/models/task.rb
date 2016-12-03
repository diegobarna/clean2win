class Task < ApplicationRecord
  belongs_to :home
  belongs_to :user
end
