# frozen_string_literal: true

class ServicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @services = Service.where(status: 'accept')
  end

  def show
    @service = Service.find(params[:id])
    @valid_ids = @service.comunas.pluck(:id)
    valid = Party.where('search = true AND user_id = (?) AND comuna_id IN (?)', current_user.id, @valid_ids)
    @valid_parties = valid.select { |x| x.contracts.select { |y| y.service_id == 1 }.count == 0  }
  end

  def new
    @service = Service.new
    @all_comunas = Comuna.all
  end

  def create
    @service = Service.create(service_params)
    @service.user_id = current_user.id if current_user

    params[:comunas][:id].each do |comuna|
      @service.coverages.build(comuna_id: comuna) unless comuna.empty?
    end

    if @service.save
      @service.status = 'pending'
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
      redirect_to service_path(@service)
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
    params.require(:service).permit(:name, :description, :capacity, :price, :status)
  end
end
