class IdeasController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    @idea.category_id = params[:idea][:category_id].to_i
    if @idea.save
      flash[:success] = "Wow what a great idea!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Hmmm that didn't save for some reason, please try again"
      redirect_to new_user_idea_path(@user)
    end
  end

  def show
    @idea = Idea.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def destroy
    @user = User.find(params[:user_id])
    idea = Idea.find(params[:id])
    idea.delete
    redirect_to user_path(@user)
  end

  def edit
    @idea = Idea.find(params[:id])
    @user = User.find(params[:user_id])
    @categories = Category.all
  end

  def update
    @idea = Idea.find(params[:id])
    @user = User.find(params[:user_id])
    @idea.update(idea_params)

    if @idea.save
      redirect_to user_idea_path(@user, @idea)
    else
      render :edit
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :notes)
  end
end
