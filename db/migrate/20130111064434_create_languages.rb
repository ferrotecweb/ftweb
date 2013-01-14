class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code
      t.boolean :default
      t.string :memo

      t.timestamps
    end
  end
end
