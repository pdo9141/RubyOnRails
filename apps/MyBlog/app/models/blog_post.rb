class BlogPost < ActiveRecord::Base
  attr_accessible :content, :publishdate, :title, :ispublished

  has_many :comments

  validates :title, :length => {:minimum => 5, :maximum => 200}
  validates :content, :length => {:minimum => 5}
end
