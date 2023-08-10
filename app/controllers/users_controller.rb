class UsersController < ApplicationController

def edit
end

def update
  if current_user.update(user_params)
    redirect_to root_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def show
  user = User.find(params[:id])
  @name = user.name
  @profile = user.profile
  @position = user.position
  @occupation = user.occupation
  @prototypes = user.prototypes
end

end