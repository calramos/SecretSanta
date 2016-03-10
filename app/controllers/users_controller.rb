class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  #def index
  #  @users = User.all
  #end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  def oauth_failure
    redirect_to 'http://giphy.com/gifs/Xcs2AoOnwklUs/html5'
    #redirect wherever you want.
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @user.wishlist = params[:user][:message]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    userId = params[:id]
    curUser = User.find_by_id(userId)

    if curUser
      curUser.wishlist = params[:wishlist]
      curUser.save
    end

    flash[:notice] = "🎄⛄️ 🎄⛄️ 🎄⛄️  Wishlist updated! 🎄⛄️ 🎄⛄️ 🎄⛄️ "
    redirect_to "/"

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params.require(:user).permit(:wishlist)
    end
end
