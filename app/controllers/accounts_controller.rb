class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @account = current_user.account
    @account_users = @account.users
  end
end