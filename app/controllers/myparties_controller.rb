class MypartiesController < ApplicationController
  def show
    @user = current_user
    @my_parties = Party.where(user_id: @user.id)
  end
end
