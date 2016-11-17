class EpisodesController < ApplicationController
  before_action :find_member
  before_action :find_episode, only: [:show, :edit, :update, :destroy]

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

  def edit

  end

  def update
    if @episode.update episode_params
      redirect_to member_episode_path(@member, @episode), notice: "Episode telah berhasil diperbarui"
    else
      render 'edit'
    end
  end

  def destroy
    @episode.destroy
    redirect_to root_path
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
