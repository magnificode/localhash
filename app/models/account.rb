class Account < ActiveRecord::Base
	has_many :memberships, :dependent => :destroy
	has_many :users, :through => :memberships

	validates_uniqueness_of :name, :scope => [:name, :random]

	def owner
		users.joins(:memberships).where('memberships.is_the_owner = true').first
	end
end