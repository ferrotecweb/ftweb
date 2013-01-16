class Language < ActiveRecord::Base
  attr_accessible :code, :default, :link, :memo
end
