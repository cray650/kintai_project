class TimeCardsController < ApplicationController
  
  def index
    @year = Time.current.year
    @month = Time.current.month
  end

  def new
    @time_card = TimeCard.new
  end

  def create
    @time_card = TimeCard.new
  end
end
