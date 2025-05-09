class FriendsController < ApplicationController
  def create
    friend_user = User.find(params[:friend])
    current_user.friendships.create(friend: friend_user, status: 0)
  end

  def index
    if params[:query]
      @friends = User.where(id: params[:query])
    end

      @requests = current_user.inverse_friendships.where(status: 0)
      @currentfriends = (
      current_user.friendships.where(status: 1).map(&:friend) +
      current_user.inverse_friendships.where(status: 1).map(&:user)
      ).uniq

    @users = User.all
  end

  def update
    friendship = Friendship.find(params[:id])
    if friendship.status == 0
      friendship.update(status: 1)
    else
      friendship.update(status: 0)
    end
  end

  def destroy
    friend = User.find_by(params[:id])
    friend = User.find(params[:id])  # the user you're trying to unfriend
    friendship = Friendship.find_by(user: current_user, friend: friend) ||
                 Friendship.find_by(user: friend, friend: current_user)
    friendship.destroy!
  end
end
