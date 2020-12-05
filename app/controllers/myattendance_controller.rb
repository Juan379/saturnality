# frozen_string_literal: true

class MyattendanceController < ApplicationController
  def show
    @user = current_user
    @closed_parties = @user.attendees.select { |x| x.status != "rejected" }
  end
end