class Beer < ActiveRecord::Base

  belongs_to :brewery
  belongs_to :category
  belongs_to :style

end
