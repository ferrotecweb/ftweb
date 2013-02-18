class AddSortToContents < ActiveRecord::Migration
  def change
    add_column :contents, :sort, :integer, :default => 0
  end
end
