class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.string :summary
      t.integer :company_id,  :default =>0
      t.integer :language_id, :default => 0
      t.integer :parent_id,   :default => 0
      t.integer :level,       :default => 0
      t.integer :sort,        :default => 0

      t.timestamps
    end
  end
end
