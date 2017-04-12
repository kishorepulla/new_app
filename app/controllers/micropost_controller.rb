class MicropostController < ApplicationController
  def new
  
  end

  def show
  @micropost=Micropost.find(params[:id])
  
  end

  def edit
  @micropost=Micropost.find(params[:id])
  end
  
  def create
@micropost = current_user.microposts.create({:content => params[:micropost][:content]})
if @micropost.save
flash[:success] = "Micropost created!"
redirect_to current_user
else
render 'static_pages/home'
end
end

def destroy
Micropost.find(params[:id]).destroy
redirect_to current_user
end

def update
Micropost.find(params[:id]).update_attributes({:content => params[:micropost][:content]})
redirect_to current_user

end




end
