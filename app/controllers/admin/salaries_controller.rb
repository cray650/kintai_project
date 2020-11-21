class Admin::SalariesController < ApplicationController
  def new
    @salary = Salary.new
  end

  def create
    @salary = Salary.new(salary_params)
  end

  private

  def salary_params
    params.require(:salary).permit(:salary).merge(user_id: current_user.id)
  end
end
