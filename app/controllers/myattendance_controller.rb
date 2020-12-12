# frozen_string_literal: true

class MyattendanceController < ApplicationController
  def show
    @user = current_user
    @closed_parties = @user.attendees.reject { |x| x.status == 'rejected' }
  end
end
