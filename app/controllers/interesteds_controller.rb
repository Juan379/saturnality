# frozen_string_literal: true

class InterestedsController < ApplicationController
  def create
    @party = Party.find(params[:party_id])
    @interested = @party.interesteds.create(interested_params)
    @interested.user_id = current_user.id

    redirect_to party_path(@party) if @interested.save
  end

  # def destroy
  #     @service = Service.find(params[:service_id])
  #     @servicereview = @service.servicereviews.find(params[:id])
  #     @servicereview.destroy
  #     redirect_to service_path(@service)
  # end

  def index
    @interesteds = Interested.all
  end

  def show
    @party = Party.find(params[:party_id])
    @interesteds = @party.interesteds
  end

  # def edit
  #     @servicereview = Servicereview.find(params[:id])
  # end

  private

  def interested_params
    params.require(:interested).permit(:offer)
  end
end
