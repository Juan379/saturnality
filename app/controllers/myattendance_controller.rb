# frozen_string_literal: true

class MyattendanceController < ApplicationController
  def show
    @user = current_user
    @closed_parties = @user.attendees
  end
end
