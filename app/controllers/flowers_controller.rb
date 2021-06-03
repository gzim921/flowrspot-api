class FlowersController < ApplicationController
  before_action :authorized, except: :index
  def index
    @flowers = Flower.all
    render json: { flowers: @flowers }
  end
end
