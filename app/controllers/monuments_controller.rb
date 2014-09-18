class MonumentsController < ApplicationController
  before_action :find_collection
  before_action :find_monument, only: [:edit, :update, :destroy]

  def new
    @monument = @collection.monuments.build
  end

  def edit
  end

  def create
    @monument = @collection.monuments.build(monument_params)

    if @monument.save
      redirect_to :root, notice: 'Monument was successfully created.'
    else
      render :new
    end
  end

  def update
    if @monument.update(monument_params)
      redirect_to :root, notice: 'Monument was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @monument.destroy
    redirect_to :root, notice: 'Monument was successfully destroyed.'
  end

  private
    def find_collection
      @collection = Collection.find(params[:collection_id])
    end

    def find_monument
      @monument = @collection.monuments.find(params[:id])
    end

    def monument_params
      params.require(:monument).permit(:name, :description)
    end
end
