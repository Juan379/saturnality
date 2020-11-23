# frozen_string_literal: true

module PartiesHelper
  def user_is_interested(current_user, party)
    party.interesteds.each do |interested|
      return interested if current_user.id == interested.user_id
    end
    false
  end

  def how_much_interesteds(party)
    count = 0
    party.interesteds.each do |interested|
      count += 1 if interested.offer
    end
    count
  end

  def how_much_money(party)
    count = 0
    party.interesteds.each do |interested|
      count += interested.offer.to_i
    end
    count
  end
end
