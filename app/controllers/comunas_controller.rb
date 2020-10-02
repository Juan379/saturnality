class ComunasController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @comunas = Comuna.all
    end

    def show
        @comuna = Comuna.find(params[:id])
    end

    def new
        @comuna = Comuna.new
    end

    def create
        @comuna = Comuna.create(comuna_params)
        if @comuna.save
            redirect_to comunas_path
        else
            render :new
        end
    end

    def edit
        @comuna = Comuna.find(params[:id])
    end


    def update
        @comuna = Comuna.find(params[:id])
        if @comuna.update(comuna_params)
            redirect_to comunas_path
        else
            render :edit
        end
    end


    def destroy 
        @comuna = Comuna.find(params[:id])
        @comuna.destroy
        redirect_to comunas_path
    end


    private

    def comuna_params
        params.require(:comuna).permit(:name)
    end
end