class ServicesController < ApplicationController
    skip_before_action :verify_authenticity_token


    def index
        @services = Service.all
    end

    def show
        @service = Service.find(params[:id])

    end

    def new
        @service = Service.new
        @all_comunas = Comuna.all
        @coverages = @service.coverages.build
    end

    def create
        @service = Service.create(service_params)

        params[:comunas][:id].each do |comuna|
            if !comuna.empty?
                @service.coverages.build(:comuna_id => comuna)
            end
        end

        if @service.save
            redirect_to services_path
        else
            render :new
        end
    end

    def edit
        @service = Service.find(params[:id])
    end

    def update
        @service = Service.find(params[:id])
        if @service.update(service_params)
            redirect_to services_path
        else
            render :edit
        end
    end

    def destroy 
        @service = Service.find(params[:id])
        @service.destroy
        redirect_to services_path
    end

    private

    def service_params
        params.require(:service).permit(:name, :description, :capacity, :price, :rating)
    end
end