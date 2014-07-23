class Book < ActiveRecord::Base
	
	#has_and_belongs_to_many :users

	validates :title,		:presence => true,
											:length => {:maximum => 50}
	validates :author,		:presence => true,
											:length => {:maximum => 50}
	validates :year,		:presence => true

	scope :newest_first, lambda {order("books.created_at DESC")}

end
