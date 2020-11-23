# frozen_string_literal: true

class MyaservicesController < ApplicationController
  def show
    @user = current_user
    @services = Service.where(user_id: @user.id, status: 'accept')
  end
end
