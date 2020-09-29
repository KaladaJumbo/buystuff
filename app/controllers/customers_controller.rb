class CustomersController < ApplicationController

    before_action :define_variable, only: [:show, :edit, :update, :destroy]
    before_action :restrict_access, only: [:show, :edit, :update, :destroy, :index]

    def index

        @customers = Customer.all
        render "index"

    end

    def show

        cookies[:current_customer] = params[:id]
        render "show"

    end

    def new
        @customer = Customer.new
        render "new"
    end

    def create
        @customer = Customer.create(strong_params(:name, :address, :password, :username))
        if @customer.save && @customer.authenticate(params[:customer][:password])
            session[:current_user] = @customer.id
            redirect_to welcome_path
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
        redirect_to login_path

    end

    def login #clean up one day 

        render "login"
  
    end

    def post_login
        current_user = Customer.find_by(username: params[:customer][:username])
        if current_user != nil && current_user.authenticate(params[:customer][:password]) 
            session[:current_user] = current_user.id
            redirect_to welcome_path
        else
            flash[:error] = "this user does not exist please try again"
            redirect_to login_path
        end
        
    end

    def logout

        session.clear
        flash[:error] = "you have been logged out"
        redirect_to login_path
    end

    private 

    def strong_params(*args)

        params.require(:customer).permit(*args)

    end

    def define_variable

        @customer = Customer.find(params[:id])

    end

    def restrict_access

        return head(:forbidden) unless session.include? :current_user

    end

end
