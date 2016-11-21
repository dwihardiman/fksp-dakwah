class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { @episodes = Episode.search(params[:term]) }
    end
  end
end
