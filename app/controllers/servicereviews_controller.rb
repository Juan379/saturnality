class ServicereviewsController < ApplicationController


  def destroy
    @service = Service.find(params[:service_id])
    @servicereview = @service.servicereviews.find(params[:id])
    @servicereview.destroy
    redirect_to service_path(@service)
  end

  def index
    @servicereviews = Servicereview.all
  end

  def new
    @servicereview = Servicereview.new
    @all_services = Service.all
  end

  def show
    @servicereview = Servicereview.find(params[:id])
  end

  def edit
    @servicereview = Servicereview.find(params[:id])
  end

  def create
    @servicereview = Servicereview.create(servicereview_params)
    @servicereview.service_id = Service.find(params[:service_id])
    @servicereview.user_id = current_user.id if current_user
    redirect_to services_path(@service)
  end



  private
  def servicereview_params
    params.require(:servicereview).permit(:body)
  end
end
