class ShoppersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]
    before_action :restrict_access, only: [:show, :edit, :update, :destroy, :index, :welcome]

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

        @shopper = Shopper.create(strong_params(:name, :address, :max_weight, :password, :username))
        if @shopper.save && @shopper.authenticate(params[:shopper][:password])
            session[:current_shopper] = @shopper.id
            redirect_to shopper_welcome_path
        else
            redirect_to new_shopper_path
        end

    end

    def edit

    end

    def update

    end

    def destroy

    end

    def login
        
        render "login"

    end

    def post_login

        current_user = Shopper.find_by(username: params[:shopper][:username])
        if current_user && current_user.authenticate(params[:shopper][:password])
            session[:current_shopper] = current_user.id
            redirect_to shopper_welcome_path
        else
            flash[:error] = "this user does not exist please try again"
            redirect_to shopper_login_path
        end

    end

    def logout

        session.clear
        flash[:error] = "you have been logged out"
        redirect_to shopper_login_path

    end

    def welcome
    
        @shopper = Shopper.find(session[:current_shopper])

    end

    def pickup

        order = Order.find(params[:id])
        order.update(shopper: Shopper.find(session[:current_shopper]), status: "processed")
        order.save 
        redirect_to shopper_path(session[:current_shopper])

    end


    private 

    def strong_params(*args)

        params.require(:shopper).permit(*args)

    end

    def define_variable

        @shopper = Shopper.find(params[:id])

    end

    def restrict_access

        return head(:forbidden) unless session.include? :current_shopper

    end

end
