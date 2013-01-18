# -*- coding:utf-8 *-*
class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, :size => 100  # 公司名称简称
      t.string :fullname            # 公司全称
      t.text :summary               # 公司简介
      t.string :url                 # 公司地址
      t.integer :language_id        # 语言版本（中或英）

      t.timestamps
    end
  end
end
