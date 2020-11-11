class Admin::SalariesController < ApplicationController
  def index
    @salary = Salary.all
  end

  def new
    @salary = Salary.new
  end

  def create
    @salary = Salary.new
  end

  private

  def salary_params
    params.require(:salary).permit(:salary)
  end
end
