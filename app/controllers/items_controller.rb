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

        @item = Item.new
        render "new" 

    end

    def create
        @item = Item.create(strong_params(:description, :weight, :price))
        if @item.save
            redirect_to item_path(@item)
        else

            redirect_to new_item_path
        end
    end

    def edit

        render "edit"

    end

    def update

        @item.update(strong_params(:description, :weight, :price))
        if @item.save
            redirect_to item_path(@item)
        else
            redirect_to edit_item_path
        end 

    end

    def destroy

        @item.destroy
        redirect_to items_path

    end

    private 

    def strong_params(*args)

        params.require(:item).permit(*args)

    end

    def define_variable

        @item = Item.find(params[:id])

    end

end
