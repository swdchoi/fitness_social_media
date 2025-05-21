class LikesController < ApplicationController

  def create
    @session = Session.find(params[:session_id])
    current_user.likes.create(session: @session)
  end

  def destroy
    @session = Session.find(params[:session_id])
    @like = current_user.likes.find_by(session: @session)
    @like.destroy!
  end

end