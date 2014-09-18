class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = current_user.collections
  end

  def show
  end

  def new
    @collection = current_user.collections.build
  end

  def edit
  end

  def create
    @collection = current_user.collections.build(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @collection.update(collection_params)
      redirect_to @collection, notice: 'Collection was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @collection.destroy
    redirect_to collections_url, notice: 'Collection was successfully destroyed.'
  end

  private
    def set_collection
      @collection = current_user.collections.find(params[:id])
    end

    def collection_params
      params.require(:collection).permit(:name)
    end
end
