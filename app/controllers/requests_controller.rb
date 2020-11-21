class RequestsController < ApplicationController
  before_action :set_request, only: %i[edit update destroy]
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
    @request.build_time_card
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to time_cards_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @request.update(request_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @request.destroy
      redirect_to edit_request_path
    else
      render :edit
    end
  end

  private

  def request_params
    params.require(:request).permit(:type_id, :reason, time_card_attributes: %i[year month day in out user_id]).merge(user_id: current_user.id)
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
