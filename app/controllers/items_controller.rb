class ItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Item.all, status: :ok
    end

    def show
        item = Item.find(params[:id])
        render json: item, status: :ok
    end

    def create
        item = Item.create!(items_params)
        render json: item, status: :created
    end

    def update
        item = Item.find_by(id: params[:id])
        item.update(items_params)
        render json: item, status: :ok
    end

    # def destroy
    #     item = Item.find(params[:id])
    #     item.destroy
    #     head :no_content
    # end


    private

    def items_params
        params.permit(:name, :description, :price, :category, :imgURL)
    end

    def record_not_found
        render json: {error: "Item not found"}, status: :not_found
    end

    def record_invalid
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
