class WelcomeController < ApplicationController
  def index
    @members = Member.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)

    if params[:search]
      @episodes = Episode.search(params[:search]).order("created_at DESC")
    else
      @episodes = Episode.all.order("created_at DESC")
    end

    respond_to do |format|
      format.html
      format.json { @episodes = Episode.search(params[:term]) }
    end
  end
end
