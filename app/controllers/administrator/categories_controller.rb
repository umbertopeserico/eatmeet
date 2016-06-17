class Administrator::CategoriesController < Administrator::AdministratorController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(:administrator, @category)
  end

  def update
    @category.update(category_params)
    respond_with(:administrator, @category)
  end

  def destroy
    @category.destroy
    respond_with(:administrator, @category, location: administrator_categories_path)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :image)
    end
end
