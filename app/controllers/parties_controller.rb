# frozen_string_literal: true

class PartiesController < ApplicationController
  helper PartiesHelper

  def index
    @parties = if !current_user.has_role?(:admin)
                 Party.where(search: true, ended: false)
               else
                 Party.all
               end
  end

  def close_and_notify
    party = Party.find(params[:id])
    limit = party.capacity
    cost = party.cost
    code = rand.to_s[2..11]

    candidates = party.interesteds.order(offer: :desc)[0..limit]
    unless candidates.empty?
      offer_sum = candidates.pluck(:offer).sum
      if offer_sum >= cost
        party.update_attribute(:search, false)
        party.update_attribute(:code, code)
        candidates.each do |candidate|
          Attendee.create(user_id: candidate.user_id, party_id: party.id)
          candidate.delete
        end
        redirect_to party_path(party), notice: 'Party search closed and attendees notified correctly!'
      else
        flash[:error] = "The sum of offers, $#{offer_sum}, does not cover the cost of the party!"
        redirect_to party_path(party), notice: "The sum of offers, $#{offer_sum}, does not cover the cost of the party!"
      end
    end
  end

  def show
    @party = Party.find(params[:id])
  end

  def new
    @comunas = Comuna.all
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    @party.comuna_id = params[:comuna][:id]

    @party.user_id = current_user.id if current_user
    if @party.save
      redirect_to party_path(@party), notice: 'Party created successfully! Now you can choose to hire services for your event!'
    else
      render :new
    end
  end

  def destroy
    @party = Party.find(params[:id])
    @party.destroy
    redirect_to parties_path
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    if @party.update(party_params)
      redirect_to party_path(@party)
    else
      render :edit
    end
  end

  private

  def party_params
    params.require(:party).permit(:title, :description, :address, :capacity, :cost, :search, :ended)
  end
end
