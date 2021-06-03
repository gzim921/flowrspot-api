class FlowersController < ApplicationController
  before_action :authorized, except: [:index, :show]
  def index
    @flowers = Flower.all
    render json: {flowers: @flowers}
  end

  def show
    @flower = Flower.find(params[:id])
    render json: {flower: @flower, sightings: @flower.sightings}
  end
end
