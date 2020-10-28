class PartyreviewsController < ApplicationController
  def create
    @party = Party.find(params[:party_id])
    @partyreview = @party.partyreviews.create(partyreview_params)
    redirect_to party_path(@party)
  end

  def destroy
    @party = Party.find(params[:party_id])
    @partyreview = @party.partyreviews.find(params[:id])
    @partyreview.destroy
    redirect_to party_path(@party)
  end

  private
  def partyreview_params
    params.require(:partyreview).permit(:body)
  end
end
