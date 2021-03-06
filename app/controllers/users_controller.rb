class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_filter :signed_in_user, only: [:edit, :update] 
  before_filter :correct_user, only: [:edit, :update]
  # GET /users
  # GET /users.json
  def follow
  @user = User.find(params[:id])
  end
  
  
  def index
    @k = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
 @k=User.find(params[:id]).microposts
 @kk=Relationship.where(follower_id: params[:id])
 @kk.each do |var|
 @k=@k+(User.find(var.followed_id).microposts)
  end



  
 @k=@k.paginate(:page => params[:page], :per_page => 5)
 
 @user = User.find(params[:id])
 
 
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    if(User.count>0)
    @user = User.new(:id => User.last.id+1, :name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation], :image => params[:user][:image])
    else 
	@user = User.new(:id => 1, :name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation], :image => params[:user][:image])
    end
    if @user.save
	redirect_to users_path
	else
	render 'users/index'
	end
	end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  
  @user = User.find(params[:id]) 
  if @user.update_attributes(:name => params[:user][:name], :email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation], :image => params[:user][:image]) 
  flash[:success] = "Profile updated" 
  sign_in @user 
  redirect_to @user 
  else 
  render 'edit' 
  end 
    
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

  def following
@title = "Following"
@user = User.find(params[:id])
@users = @user.followed users.paginate(page: params[:page])
render 'show_follow'
end
def followers
@title = "Followers"
@user = User.find(params[:id])
@users = @user.followers.paginate(page: params[:page])
render 'show_follow'
end
  
  
  
  private
  
  def signed_in_user 
  redirect_to signin_path, notice: "Please sign in." unless signed_in? 
  end
def correct_user 
@user = User.find(params[:id]) 
redirect_to(signin_path) unless current_user?(@user) 
end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :image)
    end
	
	
	
	
end
