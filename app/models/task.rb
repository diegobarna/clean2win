class Task < ApplicationRecord
  belongs_to :home
  belongs_to :user, optional: true
  validates :name, presence: true, length: {maximum: 40}
  validates :tags, presence: true

  private

    def deadline_is_possible?
      return if deadline.blank?
      if deadline < Date.current
        errors.add(:deadline, "can't be in the past")
      end
    end

end
