class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, :dependent => :destroy
  has_many :accounts, :through => :memberships

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_uniqueness_of :email

  after_create do |user|
    Account.transaction do
      account = Account.create!(:name => user.email, :random => SecureRandom.hex)
      account.memberships.create!(:user => user, :is_the_owner => true)
    end
  end

  def account
    accounts.joins(:memberships).where('memberships.is_the_owner = true').first
  end
end