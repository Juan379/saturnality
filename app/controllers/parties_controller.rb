class PartiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @parties = Party.all
    end
    

    def show
        @party = Party.find(params[:id])
    end

    def new
        @party = Party.new
        @all_comunas = Comuna.all
        @all_services = Service.all
        @contracts = @party.contracts.build
    end

    def create
        @selected = params[:comunas][:id]

        @party = Party.create(party_params)

        @party.comuna_id = @selected

        params[:services][:id].each do |service|
            if !service.empty?
                @party.contracts.build(:service_id => service)
            end
        end

        if @party.save
            redirect_to parties_path
        else
            render :new
        end
    end

    def edit
        @party = Party.find(params[:id])
    end

    def update
        @party = Party.find(params[:id])
        if @party.update(party_params)
            redirect_to parties_path
        else
            render :edit
        end
    end

    def destroy 
        @party = Party.find(params[:id])
        @party.destroy
        redirect_to parties_path
    end

    private
    
    def party_params
        params.require(:party).permit(:title, :description, :address, :cost, :search)
    end
end