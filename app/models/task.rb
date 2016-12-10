class Task < ApplicationRecord
  belongs_to :home
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: 40}
  validates :tags, presence: true

  def done!
    unless user_id.present?
      return false
    end
    self.user.points += points
    self.user.save!
    self.status = "done"
    save
    return true
  end

end
