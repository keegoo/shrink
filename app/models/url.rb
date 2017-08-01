class Url < ApplicationRecord
  include Rebase
  validates :origin, presence: true

  belongs_to :visit

  def self.create_with_visit(params)
    u = self.create(params)
    v = Visit.create(count: 0)
    u.visit_id = v.id
    u.save
    u
  end

  def make_it_shorten
    self.shorten = Rebase.encode(self.id.to_i)
    self.save
  end
end
