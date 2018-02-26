class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
    set_cocktail
    @dose = Dose.new
  end

  # GET /cocktails/new
  def new
    @cocktail = Cocktail.new
  end

  # POST /cocktails
  # POST /cocktails.json
  def create
    @cocktail = Cocktail.new(default_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    set_cocktail
    @cocktail.destroy

    redirect_to cocktails_path
  end

  def search
    @search_cocktails_results = Cocktail.all.select do |cocktail|
      if cocktail.name.downcase.include?(params[:search][:query].downcase)
        cocktail
      end
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def default_params
    params.require(:cocktail).permit(:name, :photo)
  end

end



