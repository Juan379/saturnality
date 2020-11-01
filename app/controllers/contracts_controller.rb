
class ContractsController < ActionController::Base
    def create
        @service = Service.find(params[:service_id])
        params[:parties][:id].each do |party|
            if !party.empty?
                @service.contracts.create(party_id: party, service_id: params[:service_id])
            end
        end
        redirect_to service_path(@service)
        # @contract = @party.contracts.build(contract_params)
        # redirect_to service_path(@service) if @servicereview.save
    end

    def contract_params
        params.require(:servicereview).permit(:body)
    end
end
