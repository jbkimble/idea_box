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
      redirect_to user_idea_path(@user, @idea)
    else
      redirect_to new_user_idea_path(@user)
    end
  end

  def show
    @idea = Idea.find(params[:id])
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :notes)
  end
end
