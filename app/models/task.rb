class Task < ApplicationRecord
  enum status: { todo: 0, doing: 1, done: 2 }
  validates :title, presence: true
  validates :status, presence: true
  validates :deadline, presence: true
  # validate :deadline, :must_start_from_today

  def self.ransackable_attributes(auth_object = nil)
    ["title", "description", "created_at", "updated_at", "deadline", "status"]
  end
  
  def self.ransackable_associations(auth_object = nil)
    []
  end

  
  # def must_start_from_today
  #   errors.add(:deadline, 'must start from today.') if deadline.present? && deadline < Date.current
  # end
end
