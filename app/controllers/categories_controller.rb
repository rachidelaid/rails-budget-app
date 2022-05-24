class CategoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
   @categories = Category.where(user_id: current_user.id)
  end

  def new; end

  def create
    category = Category.new(allowed_params)
    category.user_id = current_user.id
    if category.save
      redirect_to categories_path
      flash[:notice] = 'category created successfully'
    else
      redirect_to categories_path
      flash[:alert] = 'An error has occurred while creating the category'
    end
  end

  private

  def allowed_params
    params.require(:category).permit(:name, :logo)
  end
end