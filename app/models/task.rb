class Task < ApplicationRecord
  belongs_to :home
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: 20}
  validates :room, presence: true
  validates :action, presence: true

  def new_deadline
    return since_done ? Date.today + every : deadline + every
  end

end
