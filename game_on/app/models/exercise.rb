class Exercise < ActiveRecord::Base
  belongs_to :user
  actable

  scope :newest_first, lambda { order("exercises.created_at DESC") }
  scope :oldest_first, lambda { order("exercises.created_at ASC") }
  scope :search, lambda {|query|
    where(["name LIKE ?", "#{query}%"])
  }
end
