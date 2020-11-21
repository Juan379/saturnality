# frozen_string_literal: true

class ContractsController < ApplicationController
  def create
    @service = Service.find(params[:service_id])
    params[:parties][:id].each do |party|
      @service.contracts.create(party_id: party, service_id: params[:service_id]) unless party.empty?
    end
    redirect_to service_path(@service)
  end

  def contract_params
    params.require(:servicereview).permit(:body)
  end
end
