class MypservicesController < ApplicationController
    def show
        @user = current_user
        @pending_services = Service.where(user_id: @user.id, status: "pending")
    end
end