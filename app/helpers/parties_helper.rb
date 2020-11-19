module PartiesHelper

    def user_is_interested(current_user, party)
        party.interesteds.each do |interested|
            if current_user.id == interested.user_id
                return interested
            end
        end
        return false
    end
end