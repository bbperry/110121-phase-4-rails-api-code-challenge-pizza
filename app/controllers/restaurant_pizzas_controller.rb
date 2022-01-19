class RestaurantPizzasController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def create
        restaurantPizza = RestaurantPizza.create!(restaurantPizza_params)
        render json: restaurantPizza.pizza, status: :created
    end



private

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end


    def restaurantPizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end    

end
