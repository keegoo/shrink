class Visit < ApplicationRecord
  validates :count, presence: true

  def increment
    self.count += 1
    self.save
  end
end
