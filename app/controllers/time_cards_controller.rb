class TimeCardsController < ApplicationController
  before_action :set_time_card, only:[:edit, :update, :delete]
  before_action :authenticate_user!, only: [:new, :index]
  before_action :today, only: [:index, :new, :edit]
  before_action :move_to_index, only: :edit

  def index
    date = Date.today
    @start_date = date.beginning_of_month.to_s
    @end_date = date.end_of_month.to_s
  end

  def new
    @today_card = TimeCard.where(year: @year, month: @month, day: @day, user_id: current_user.id)
    @time_card = TimeCard.today(current_user)
  end

  def create
    @today_card = TimeCard.where(year: @year, month: @month, day: @day, user_id: current_user.id)
    @time_card = TimeCard.new(time_card_params)
   
    if @time_card.save
      redirect_to time_cards_path
    else
      redirect_to new_time_card_path
    end
  end

  def edit
  end

  def update
    if @time_card.update(time_card_params)
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
    @time = Time.zone.now
    @time_cards =TimeCard.all
  end

  def set_time_card
    @time_card = TimeCard.find(params[:id])
  end

  def move_to_index
    redirect_to unless current_user.id == @time_card.user_id
  end
end
