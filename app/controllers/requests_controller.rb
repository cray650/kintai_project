class RequestsController < ApplicationController
  def new
    @request = Request.new
    @request.build_time_card
  end

  def create
    binding.pry
    @request = Request.new(request_params)
    if @request.save
      redirect_to time_cards_path
    else 
      render :new
    end
  end


  private
  
  def request_params
    params.require(:request).permit(:type_id, :reason, time_card_attributes:[:year, :month, :day, :in, :out, :user_id]).merge(user_id: current_user.id)
  end
end
