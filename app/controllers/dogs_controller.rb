class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to dog_path(@dog.id)
    else
      render :new
    end
  end

  def show
    @dog = Dog.find(params[:id])
  end

  private

    def dog_params
      params.require(:dog).permit(:name, :breed)
    end

end
