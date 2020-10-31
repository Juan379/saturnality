# frozen_string_literal: true

class ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @services = Service.all
  end

  def show
    @service = Service.where(id: params[:id])
    @all_parties = Party.where(id: current_user.id, )

  end

  def new
    @service = Service.new
    @coverages = @service.coverages.build
  end

  def create
    @service = Service.create(service_params)

    @service.user_id = current_user.id if current_user

    params[:comunas][:id].each do |comuna|
      @service.coverages.build(comuna_id: comuna) unless comuna.empty?
    end

    if @service.save
      redirect_to services_path
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to services_path
    else
      render :edit
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:name, :description, :capacity, :price, :rating)
  end
end
