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
        contador = 0
        party.interesteds.each do |interested|
            contador += 1
        end
        return contador
    end    

    def how_much_money(party)
        contador = 0
        party.interesteds.each do |interested|
            contador += interested.offer.to_i
        end
        return contador
    end    

end