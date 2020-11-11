class Admin::RequestsController < ApplicationController
  before_action :set_request, only: %i[edit update]
  before_action :if_not_admin, only: %i[index edit]

  def index
    @requests = Request.all.order(created_at: 'ASC')
  end

  def edit; end

  def update
    if params[:approval] = 'true'
      @request.update(approval: 'true')
      redirect_to admin_time_cards_path
    elsif params[:approval] = 'false'
      @request.update(approval: 'false')
      redirect_to admin_time_cards_path
    else
      render :new
    end
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
