# frozen_string_literal: true

class ServicereviewsController < ApplicationController
  def create
    @service = Service.find(params[:service_id])
    @servicereview = @service.servicereviews.create(servicereview_params)
    @servicereview.user_id = current_user.id

    redirect_to service_path(@service) if @servicereview.save
  end

  def destroy
    @service = Service.find(params[:service_id])
    @servicereview = @service.servicereviews.find(params[:id])
    @servicereview.destroy
    redirect_to service_path(@service)
  end

  def index
    @servicereviews = Servicereview.all
  end

  def show
    @servicereview = Servicereview.find(params[:id])
  end

  def edit
    @servicereview = Servicereview.find(params[:id])
  end

  private

  def servicereview_params
    params.require(:servicereview).permit(:body)
  end
end
