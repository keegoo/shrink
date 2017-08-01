class AddVisitIdToUrls < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :visit_id, :integer
  end
end
