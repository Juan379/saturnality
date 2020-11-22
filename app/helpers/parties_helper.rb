module PartiesHelper

    def user_is_interested(current_user, party)
        party.interesteds.each do |interested|
            if current_user.id == interested.user_id
                return interested
            end
        end
        return false
    end

    def how_much_interesteds(party)
        count = 0
        party.interesteds.each do |interested|
            if interested
                count += 1
            end
        end
        return count
    end    

    def how_much_money(party)
        count = 0
        party.interesteds.each do |interested|
            count += interested.offer.to_i
        end
        return count
    end    

end