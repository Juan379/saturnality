# frozen_string_literal: true

class ScommentsController < ApplicationController
  def index
    @scomments = Scomment.all
  end

  def new
    @scomment = Scomment.new
    @all_services = Service.all
  end

  def show
    @scomment = Scomment.find(params[:id])
  end

  def edit
    @scomment = Scomment.find(params[:id])
  end

  def create
    @scomment = Scomment.create(scomment_params)

    @scomment.service_id = @selected

    @scomment.user_id = current_user.id if current_user

    if @scomment.save
      redirect_to scomments_path
    else
      render :new
    end
  end

  def update
    @scomment = Scomment.find(params[:id])
    if @scomment.update(scomment_params)
      redirect_to scomments_path
    else
      render :edit
    end
  end

  def destroy
    @scomment = Scomment.find(params[:id])
    @scomment.destroy
    redirect_to scomments_path
  end

  private

  def scomment_params
    params.require(:scomment).permit(:user_id, :service_id, :content)
  end
end
