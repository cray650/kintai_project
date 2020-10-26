class TimeCardsController < ApplicationController
  
  def index
    date = Date.today
    @year = Time.current.year
    @month = Time.current.month
    @start_date = date.beginning_of_month.to_s
    @end_date = date.end_of_month.to_s
    @time_cards =TimeCard.all
  end

  def new
    @year = Time.current.year
    @month = Time.current.month
    @day = Time.current.day
    @time = Time.current
    @time_card = TimeCard.new
  end

  def create
    @time_card = TimeCard.new(time_card_params)

    if params[:in]
      @time_card.in = Time.now
    elsif params[:out]
      @time_card.out = Time.now
    end

=begin
    if @time_card.save
      render :index
    else
      redirct_to  new_time_card_path
    end
=end
  end

  private
  def time_card_params
    params.require(:time_card).permit(:year, :month, :day, :in, :out).merge(user_id: current_user.id)
  end
end
