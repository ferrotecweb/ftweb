class Language < ActiveRecord::Base
  attr_accessible :code, :default, :memo
end
