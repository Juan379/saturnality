class AdminController < ApplicationController
  def show
    @services = Service.where(status: "pending")
  end
end
