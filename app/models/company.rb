class Company < ActiveRecord::Base
  attr_accessible :fullname, :language_id, :name, :summary, :url
end
