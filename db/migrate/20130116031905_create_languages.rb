# -*- coding:utf-8 *-*
class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code, :size => 10  #语言代码，十个字符就够了，简体中文是zh-CN
      t.boolean :default, :default => false  # 是否缺省页, 所有的语言中，只有一个默认页
      t.string :link     # 该页对应的URI, 注意后面要加上／ 比如 http://www.abc.com/
      t.string :memo     # 说明 -- 该代码对应的语言就可以了

      t.timestamps
    end

    # 创建默认的二个代码，中文和英文
    Language.create(:code => 'zh-CN',
                    :default => true,
                    :link => 'http://www.ft.local:3000/',
                    :memo => '简体中文')
    Language.create(:code => 'en',
                    :default => false,
                    :link => 'http://en.ft.local:3000/',
                    :memo => '英文')
  end
end
