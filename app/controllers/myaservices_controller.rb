class MyaservicesController < ApplicationController
    def show
        @user = current_user
        @pending_services = Service.where(user_id: @user.id, status: "accept")
    end
end