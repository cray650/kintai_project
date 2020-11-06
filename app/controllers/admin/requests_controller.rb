class Admin::RequestsController < ApplicationController

  def index
    @requests = Request.all.order(created_at: "ASC")
  end

  def edit
    @request = Request.find(params[:id])
  end

  def update
    request = Request.find(params[:id])
    if request.update(approval: params[:approval])
      redirect_to admin_time_cards_path
    else 
      render :new
    end
  end

  private

=begin
  def request_params
    params.require(:request).permit(:approval)
  end
=end
end
