class Language < ActiveRecord::Base
  attr_accessible :code, :default, :link, :memo
  validates :code, :uniqueness => true
  validates :code, :presence => true

  has_many :companies
  has_many :categories
  has_many :contents
end
