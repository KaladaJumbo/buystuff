class OrdersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]


    def index

        @orders = Order.where("status = 'pending'")
        render "index"

    end

    def show

        render "show"

    end

    def new

        @order = Order.new
        render "new"

    end

    def create

        @order = Order.create(customer: Customer.find(session[:current_user].to_i), name: params[:order][:name])
        @order.status = "pending"
        @order.item_ids = params[:order][:item_ids]
        
        if @order.save
            redirect_to customer_path(session[:current_user].to_i)
        else
            render "new"
        end

    end

    def edit


    end

    def update

    end

    def destroy

        @order.destroy
        redirect_to shopper_welcome_path

    end

    private 

    def strong_params(*args)

        params.require().permit(*args)

    end

    def define_variable

        @order = Order.find(params[:id])

    end

    def restrict_access

        return head(:forbidden) unless session.include? :current_shopper

    end

end
