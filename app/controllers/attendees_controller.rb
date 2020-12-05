# frozen_string_literal: true

class AttendeesController < ApplicationController

  def accept_invitation
    party = Party.find(params[:id])
    attendee = Attendee.where(user_id: current_user.id, party_id: party.id).first
    attendee.update_attribute(:status, "accepted")
    redirect_to party_path(party), notice: 'Party invitation accepted successfully!'
  end

  def reject_invitation
    party = Party.find(params[:id])
    attendee = Attendee.where(user_id: current_user.id, party_id: party.id).first
    attendee.update_attribute(:status, "rejected")
    redirect_to party_path(party), notice: 'Party invitation rejected successfully.'
  end
end
