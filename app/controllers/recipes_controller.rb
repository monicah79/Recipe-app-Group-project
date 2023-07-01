class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    @inventory_id = params[:inventory_id]

    @inventories = Inventory.all

    respond_to do |format|
      format.html
      format.json { render json: @recipe }
    end
    @foods = Food.all
    @recipe_food = RecipeFood.includes(recipe: :food).where(recipe_id: params[:id])
    @recipe_foods = RecipeFood.find_by(recipe_id: @recipe.id)
  end

  def new
    @recipe = Recipe.new
  end

  def generate_shopping_list
    p params, '-------------'
    @recipe = Recipe.find(params[:generate_shopping_list][:recipe_id])
    @inventory = Inventory.find(params[:generate_shopping_list][:inventory_id])

    redirect_to shopping_list_path(recipe_id: @recipe.id, inventory_id: @inventory.id),
                notice: 'Shopping list generated successfully.'
  end

  def edit; end

  def create
    current_user
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_visibility
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
