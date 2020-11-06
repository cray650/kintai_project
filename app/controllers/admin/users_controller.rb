class Admin::UsersController < ApplicationController
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
end
