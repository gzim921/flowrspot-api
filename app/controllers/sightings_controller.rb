class SightingsController < ApplicationController
  before_action :authorized, except: :index

  def index
    @flower = Flower.find(params[:id])
    render json: { flower: @flower, sightings: @flower.sightings }
  end

  def create
    @flower = Flower.find(params[:flower_id])
    @sighting = @flower.sightings.build(sighting_params)
    @sighting.user = logged_in_user
    if @sighting.save
      UpdateQuestionJob.perform_now(@sighting.id)
      render json: { flower: @flower, sightings: @flower.sightings }
    else
      render json: { error: 'Invalid parameters!' }
    end
  end

  def destroy
    sighting = Sighting.find(params[:id])
    if same_sight_user?(sighting.user)
      if sighting.destroy
          render json: { note: 'Destroyed successfully!' }
      else
          render json: { note: 'Something went wrong!' }
      end
    else
      render json: {note: 'You dont have permission!!'}
    end
  end

  private

  def sighting_params
    params.permit(:longitude,:latitude,:image)
  end
end
