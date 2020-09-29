class ShoppersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]

    def index

        @shoppers = Shopper.all
        render "index"

    end

    def show

        render "show"

    end

    def new

        @shopper = Shopper.new
        render "new"

    end

    def create

        @shopper = Shopper.create(strong_params(:name, :address, :max_weight))
        

    end

    def edit

    end

    def update

    end

    def destroy

    end

    def login

    end

    def post_login

    end

    def logout

    end


    private 

    def strong_params(*args)

        params.require().permit(*args)

    end

    def define_variable

        @shopper = Shopper.find(params[:id])

    end

end
