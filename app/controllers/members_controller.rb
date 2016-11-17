class MembersController < ApplicationController
  def index
    @members = Member.all.order("created_at DESC")
  end

  def show
    @member = Member.find(params[:id])
  end
end
