class MembersController < ApplicationController
  before_action :find_member, only: [:show, :dasbor]
  before_action :find_episode, only: [:show, :dasbor]

  def index
    @members = Member.all.order("created_at DESC")
  end

  def show
  end

  def dasbor
  end

  private

  def find_episode
    @episodes = Episode.where(member_id: @member).order("created_at DESC")
  end

  def find_member
    if params[:id].nil?
      @member = current_member
    else
      @member = Member.find(params[:id])
    end
  end
end
