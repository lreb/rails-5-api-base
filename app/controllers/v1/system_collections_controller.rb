class V1::SystemCollectionsController < ApplicationController
  before_action :set_system_collection, only: [:show, :update, :destroy]

  # GET /system_collections
  def index
    @system_collections = SystemCollection.all

    render json: @system_collections
  end

  # GET /system_collections/1
  def show
    render json: @system_collection
  end

  # POST /system_collections
  def create
    @system_collection = SystemCollection.new(system_collection_params)

    if @system_collection.save
      render json: @system_collection, status: :created, location: @system_collection
    else
      render json: @system_collection.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /system_collections/1
  def update
    if @system_collection.update(system_collection_params)
      render json: @system_collection
    else
      render json: @system_collection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /system_collections/1
  def destroy
    @system_collection.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_collection
      @system_collection = SystemCollection.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def system_collection_params
      params.require(:system_collection).permit(:internal_name, :external_name, :type, :deleted)
    end
end
