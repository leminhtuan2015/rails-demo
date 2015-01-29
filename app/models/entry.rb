class Entry < ActiveRecord::Base
  include ApplicationHelper 
  has_many :comments, dependent: :destroy
  belongs_to :user

  after_destroy :a_destroy
  after_save :a_save

  	def a_destroy
      publish
  	end

  	def a_save
      publish
  	end

end
