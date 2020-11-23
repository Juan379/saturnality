# frozen_string_literal: true

class InterestedsController < ApplicationController
  def create
    @party = Party.find(params[:party_id])
    @interested = @party.interesteds.build(interested_params)
    @interested.user_id = current_user.id

    redirect_to party_path(@party) if @interested.save
  end

  def index
    @interesteds = Interested.all
  end

  def update
    @interested = Interested.find(params[:id])
    if @interested.update(interested_params)
      redirect_to party_path(@interested.party_id)
    else
      render :edit
    end
  end

  def destroy
    @interested = Interested.find(params[:id])
    @parti_id = @interested.party_id
    @interested.destroy
    redirect_to party_path(@parti_id)
  end

  def show
    @party = Party.find(params[:party_id])
    @interesteds = @party.interesteds
  end

  def edit
    @interested = Interested.find(params[:id])
  end

  private

  def interested_params
    params.require(:interested).permit(:offer)
  end
end
