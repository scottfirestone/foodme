class RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  respond_to :json

  def index
    Rails.logger.info(request.filtered_parameters)
    @restaurant = Restaurant.all.sample.name
    # respond_with @restaurants.all.sample
    render text: "You should totes try #{@restaurant}"
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    slack_response = request.filtered_parameters
      @restaurant = Restaurant.new(name: slack_response['text'])
    if @restaurant.save
      render text: "You recommended #{@restaurant.name}"
      # HTTP request that returns to the slack provided hook
      # slack_response['response_url']
      #to_slack = {text: "You created a restaurant called #{@restaurant.name}"}.to_json
      #Faraday.new(slack_response['response_url']).post do |req|
      #  req.body = to_slack
      #end
      #respond_with @restaurant
    else
      respond_with @restaurant.errors.full_messages
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    respond_with @restaurant
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:name, :category)
    end
end
