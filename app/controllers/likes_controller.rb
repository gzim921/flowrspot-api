class LikesController < ApplicationController
  def create
    @sighting = Sighting.find(params[:sighting_id])
    @likes = @sighting.likes.build(user: logged_in_user)

    if@likes.save
      render json: { note: 'Sighting liked successfully!' }
    else
      render json: { note: 'Something went wrong!!' }
    end
  end

  def destroy
    sighting = Sighting.find(params[:sighting_id])
    like = Like.find_by(user: logged_in_user, sighting: sighting)

    if like.destroy
      render json: { note: 'You disliked this sighting!' }
    else
      render json: { note: 'Something went wrong!!' }
    end
  end
end
