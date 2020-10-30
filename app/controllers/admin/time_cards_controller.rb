class Admin::TimeCardsController < ApplicationController
  before_action :if_not_admin
  before_action :set_time_card


  private
  def if_not_admin
     redirect_to root_path unless current_user.admin?
  end

  def set_time_card
    @time_card = TimeCard.find(params[:id])
  end
end
