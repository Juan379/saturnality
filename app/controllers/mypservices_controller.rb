# frozen_string_literal: true

class MypservicesController < ApplicationController
  def show
    @user = current_user
    @services = Service.where(user_id: @user.id, status: 'pending')
  end
end
