# frozen_string_literal: true

class PartyreviewsController < ApplicationController
  def create
    @party = Party.find(params[:party_id])
    @partyreview = @party.partyreviews.build(partyreview_params)
    @partyreview.user_id = current_user.id

    redirect_to party_path(@party) if @partyreview.save
  end

  def destroy
    @party = Party.find(params[:party_id])
    @partyreview = @party.partyreviews.find(params[:id])
    @partyreview.destroy
    redirect_to party_path(@party)
  end

  def index
    @partyreviews = Partyreview.all
  end

  def show
    @partyreview = Partyreview.find(params[:id])
  end

  def edit
    @partyreview = Partyreview.find(params[:id])
  end

  private

  def partyreview_params
    params.require(:partyreview).permit(:body)
  end
end
