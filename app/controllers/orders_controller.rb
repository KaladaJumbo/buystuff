class OrdersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]


    def index

        @order = Order.all
        render "index"

    end

    def show

        "show"

    end

    def new

        @order = Order.new
        render "new"

    end

    def create

        @order = Order.create(customer: Customer.find(cookies[:current_customer].to_i))
        @order.status = "pending"
        @order.item_ids = params[:order][:item_ids]
        
        if @order.save
            redirect_to customer_path(cookies[:current_customer].to_i)
        else
            render "new"
        end

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

        @order = Order.find(params[:id])

    end

end
