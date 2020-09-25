class CustomersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]

    def index

    end

    def show

    end

    def new

    end

    def create

    end

    def edit


    end

    def update

    end

    def destroy

    end

    private 

    def strong_params(*args)

        params.require().permit(*args)

    end

    def define_variable

        @customer = Customer.find(params[:id])

    end

end
