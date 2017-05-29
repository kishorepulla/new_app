class RelationshipsController < ApplicationController



def create

end

def destroy
@user = Relationship.find(params[:id]).followed
current_user.unfollow!(@user)
respond_to do |format|
format.html { redirect_to @user }
format.js
end
end


def new

end

def unfollow

end

def show
@follow = params[:id]
end
end
