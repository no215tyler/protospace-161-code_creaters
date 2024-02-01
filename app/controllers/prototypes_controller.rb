class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :new, :destroy]
  before_action :set_prototype, only: [:edit, :update, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def edit
    unless current_user.id == @prototype.user_id
      redirect_to root_path
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
