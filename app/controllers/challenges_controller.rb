class ChallengesController < ApplicationController
  def index
    @all_challenges = Challenge.all
    @current_challenges = Challenge.where(status: :current)
    @finished_challenges = Challenge.where(status: :finished)
  end

  def show
    @challenge = Challenge.find(params[:id])
  end
end
