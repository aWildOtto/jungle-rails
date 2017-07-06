class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def create # user friendly approach! do the name input and add category on one page.
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      @categories = Category.all
      render "admin/categories/index"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to [:admin, :categories], notice: 'Category deleted!'
    else
      @categories = Category.all
      render "admin/categories/index"
    end
  end

  private 
    def category_params
      params.require(:category).permit(
       :name,
      )  
    end

end
