class Task < ApplicationRecord
  belongs_to :home
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: 40}
  validates :tags, presence: true

  def done!
    unless user_id.present?
      return false
    end
    user.points += points
    user.save!
    status = "done"
    save
    return true
  end

  def new_deadline
    return since_done ? Date.today + every : deadline + every
  end

end
