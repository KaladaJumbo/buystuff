class ItemsController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]

    def index

        @items = Item.all
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

    private 

    def strong_params(*args)

        params.require().permit(*args)

    end

    def define_variable

        @item = Item.find(params[:id])

    end

end
