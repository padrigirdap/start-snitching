class PollutionEventsController < ApplicationController

  def index
    @pollution_events = PollutionEvent.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def shop_params
    params.require(:pollution_event).permit(:name, :address, :city, :state, :zip, :description, :offender, :likecount)
  end
end
