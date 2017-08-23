class CatsController < ApplicationController


  def index
    @cats = Cat.all
    render :index
  end

  def show
    begin
      @cat = Cat.find(params[:id])
      render :show
    rescue
      render plain: 'Cannot be found'
    end
  end

  def new
    @colors = Cat.colors
    @cat = nil
    render :new
  end

  def create
    render json: cat_params
  end

  def edit
    @colors = Cat.colors
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      render json: @cat
    else
      render json: @cat.errors.full_messages, status: :unprocessible_entity
    end
  end


  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
