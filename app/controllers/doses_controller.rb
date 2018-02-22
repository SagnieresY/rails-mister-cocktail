class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]

  def index
    @doses = Dose.all
  end

  # GET /doses/new
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # POST /doses
  # POST /doses.json
  def create
    @dose = Dose.new(default_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    set_dose
    @dose.destroy

    redirect_to doses_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def default_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
