class Admin::UsersController < ApplicationController
  before_action :if_not_admin, only: [:index, :new]

  def index
    @users = User.all.order(employee_id: "ASC")
    @day = Time.current.day
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
  end
  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
