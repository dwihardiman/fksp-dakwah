class EpisodesController < ApplicationController
  before_action :find_member
  before_action :find_episode, only: [:show]

  def new
    @episode = @member.episodes.new
  end

  def create
    @episode = @member.episodes.new episode_params
    if @episode.save
      redirect_to member_episode_path(@member, @episode)
    else
      render 'new'
    end
  end

  def show
    @episodes = Episode.where(member_id: @member).order("created_at DESC").reject { |e| e.id == @episode.id }
  end

  private

  def episode_params
    params.require(:episode).permit(:title, :description)
  end

  def find_member
    @member = Member.find(params[:member_id])
  end

  def find_episode
    @episode = Episode.find(params[:id])
  end
end
