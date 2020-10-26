class TimeCardsController < ApplicationController
  before_action :today, only: [:index, :new]

  def index
    date = Date.today
    @start_date = date.beginning_of_month.to_s
    @end_date = date.end_of_month.to_s
  end

  def new
    @time = Time.current
    @time_card = TimeCard.new
  end

  def create
    @time_card = TimeCard.new(time_card_params)
    if @time_card.save
      redirect_to time_cards_path
    else
      redirect_to new_time_card_path
    end
  end

  private
  def time_card_params
    params.require(:time_card).permit(:year, :month, :day, :in, :out).merge(user_id: current_user.id)
  end

  #今日の情報を全てインスタンス変数へ格納する
  def today
    @year = Time.current.year
    @month = Time.current.month
    @day = Time.current.day
    @time_cards =TimeCard.all
  end
end
