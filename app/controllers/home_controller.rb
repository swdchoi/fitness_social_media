class HomeController < ApplicationController
  def index
  end

  def home
  end

  def main
    @currentfriends = (
      current_user.friendships.where(status: 1).map(&:friend) +
      current_user.inverse_friendships.where(status: 1).map(&:user)
      ).uniq

      @allsessions = @currentfriends.flat_map(&:sessions) + current_user.sessions
      @sessions = @allsessions.sort_by(&:date)
  end

  def profile
  end
end
