class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  before_action :move_to_sign_in, only: [:new]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create

    @prototype = Prototype.new(prototype_params)
    # Prototype.create(prototype_params)
    if @prototype.save
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def edit
    # @prototype = Prototype.find(params[:id])
  end

  def update
    # prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to @prototype
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

private

def set_prototype
  @prototype = Prototype.find(params[:id])
end

def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in? && (@prototype.present? && current_user.id == @prototype.user_id)
    redirect_to new_user_session_path
  end
end

def move_to_sign_in
  unless user_signed_in?
    redirect_to new_user_session_path
  end
end

end
