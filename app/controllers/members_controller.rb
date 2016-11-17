class MembersController < ApplicationController
  def index
    @members = Member.all.order("created_at DESC")
  end

  def show
    @member = Member.find(params[:id])
    @episodes = Episode.where(member_id: @member).order("created_at DESC")
  end
end
