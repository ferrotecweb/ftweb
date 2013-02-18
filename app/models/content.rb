class Content < ActiveRecord::Base
  attr_accessible :content, :level, :parent_id, :title, :language_id, :company_id

  belongs_to :company
  belongs_to :language

  before_save :calc_level

protected

  def calc_level
    # 设置初始值
    self.parent_id ||= 0
    self.level = 0

    # 如果有父结点的话，当前级别为父结点级别＋1
    if self.parent_id > 0
      parent = Content.find(self.parent_id)
      self.level = parent.level + 1
    end

    # 当前结点所在的位置
    max_sort = Content.where(:parent_id => self.parent_id).maximum(:sort)
    max_sort ||= 0
    if max_sort == 0
      max_sort = Content.find(self.parent_id).sort
    end

    # 先将之后的结点顺序后移
    sql = "Update contents set sort = sort + 1 where sort > #{max_sort}"
    ActiveRecord::Base.connection.execute(sql)

    # 将数据保存在当前的结点顺序
    self.sort = max_sort + 1
  end

end
