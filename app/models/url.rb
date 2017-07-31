class Url < ApplicationRecord
  include Rebase
  validates :origin, presence: true

  def make_it_shorten
    self.shorten = Rebase.encode(self.id.to_i)
    self.save
  end
end
