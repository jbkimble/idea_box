class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @admin = User.find(session[:user_id])
  end

  def create
    category = Category.new(category_params)
    category.save
    redirect_to admin_categories_path
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end

end
