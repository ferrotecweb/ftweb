class Language < ActiveRecord::Base
  attr_accessible :code, :default, :link, :memo
  validates :code, :uniqueness => true
end
