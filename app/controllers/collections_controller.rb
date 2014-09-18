class CollectionsController < ApplicationController
  before_action :set_collection, only: [:edit, :update, :destroy]

  def new
    @collection = current_user.collections.build
  end

  def edit
  end

  def create
    @collection = current_user.collections.build(collection_params)
    if @collection.save
      redirect_to :root, notice: 'Collection was successfully created.'
    else
      render :new
    end
  end

  def update
    if @collection.update(collection_params)
      redirect_to :root, notice: 'Collection was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to :root, notice: 'Collection was successfully destroyed.'
  end

  private

  def set_collection
    @collection = current_user.collections.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name)
  end
end
