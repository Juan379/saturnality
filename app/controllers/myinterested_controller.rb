# frozen_string_literal: true

class MyinterestedController < ApplicationController
  def show
    @user = current_user
    @parties = Party.where(search: true)
  end
end
