class WelcomeController < ApplicationController
  def index
    @members = Member.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
    respond_to do |format|
      format.html
      format.json { @episodes = Episode.search(params[:term]) }
    end
  end
end
