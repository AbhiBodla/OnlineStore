class UsersController < ApplicationController

    def index
      authorize current_user
      @users = User.all
    end

    def edit 

        @user = User.find(params[:id])
        authorize current_user


    end

      
    def find
      @user = User.new
    end

    

    def create 
      @user = Service.new(user_params)


      respond_to do |format|
        if @user.save
          ActionCable.server.broadcast("room_channel", {content: "New user added ", for_user: "admin" })
          format.html { redirect_to @uder, notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @user = User.find(params[:id])
      authorize @user
      if @user.update(user_params)
        redirect_to users_url, notice: "user was successfully updated"
      else
        render :edit,status: :unprocessable_entry
      end

    end


    private
    def user_params
     params.require(:user).permit(:name, :email, :password, :role)
    end



end