class OrderItemsController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]

    def index

        @order_items = OrderItem.all
        render "index"

    end

    def show

        render "show"

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

    def welcome 

        render "welcome"

    end

    def homepage

        if session[:current_user]
            redirect_to welcome_path
        else 
            render "login"
        end

    end

    private 

    def strong_params(*args)

        params.require().permit(*args)

    end

    def define_variable

        @order_item = OrderItem.find(params[:id])

    end

end
