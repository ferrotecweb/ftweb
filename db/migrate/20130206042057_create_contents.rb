class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :content
      t.integer :company_id
      t.integer :language_id
      t.integer :parent_id
      t.integer :level

      t.timestamps
    end
  end
end
