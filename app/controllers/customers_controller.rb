class CustomersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]

    def index

        @customers = Customer.all
        render "index"

    end

    def show

        render "show"

    end

    def new
        @customer = Customer.new
        render "new"
    end

    def create
        @customer = Customer.create(strong_params(:name, :address))
        if @customer.save
            redirect_to customer_path(@customer)
        else

            redirect_to new_customer_path
        end
    end

    def edit

        render "edit"

    end

    def update

        @customer.update(strong_params(:name, :address))
        if @customer.save
            redirect_to customer_path(@customer)
        else
            redirect_to edit_customer_path
        end 

    end

    def destroy

        @customer.destroy
        redirect_to customers_path

    end

    private 

    def strong_params(*args)

        params.require(:customer).permit(*args)

    end

    def define_variable

        @customer = Customer.find(params[:id])

    end

end
