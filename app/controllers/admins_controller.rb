class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def dasbor
    @members = Member.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
    @episodes = Episode.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @episode = Episode.friendly.find(params[:id])
  end

  def destroy
    @episode = Episode.friendly.find(params[:id])
    @episode.destroy

    redirect_to :back
  end
end
