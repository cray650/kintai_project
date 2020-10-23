class TimeCardsController < ApplicationController
  
  def index
    @year = Time.current.year
    @month = Time.current.month
  end

  def new
    @year = Time.current.year
    @month = Time.current.month
    @day = Time.current.day
    @time_card = TimeCard.new

  end

  def create
    @time_card = TimeCard.new(time_card_params)
    if @time_card.save
      render :index
    else
      render :new
    end
  end

  private
  def time_card_params
    params.require(:time_card).permit(:year, :month, :day, :in, :out).merge(user_id: current_user.id)
  end
end
