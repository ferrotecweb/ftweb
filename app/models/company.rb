class Company < ActiveRecord::Base
  attr_accessible :fullname, :language_id, :name, :summary, :url
  validates :name, :uniqueness => true
  validates :name, :presence => true

  belongs_to :language
  has_many   :categories
  has_many   :contents
end
