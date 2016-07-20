class PollutionEventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pollution_events = PollutionEvent.all
    @pollution_event = PollutionEvent.new
  end

  def new
    @pollution_event = PollutionEvent.new
  end

  def create
    @pollution_event = PollutionEvent.new(pollution_params)
    @pollution_event.user = current_user
    if @pollution_event.save
      flash[:notice] = "Event created successfully"
      redirect_to pollution_event_path(@pollution_event)
    else
      flash.now[:error] = @pollution_event.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @pollution_event = PollutionEvent.find(params[:id])
    @comments = @pollution_event.comments
  end

  def edit
    @pollution_event = PollutionEvent.find(params[:id])
  end

  def update
    @pollution_event = PollutionEvent.find(params[:id])
    if @pollution_event.update_attributes(pollution_params)
      flash[:notice] = "Event updated!"
      redirect_to pollution_event_path(@pollution_event)
    else
      flash.now[:error] = @pollution_event.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @pollution_event = PollutionEvent.find(params[:id])
    @pollution_event.destroy
    flash[:notice] = "Event deleted!"
    redirect_to pollution_events_path
  end

  def pollution_params
    params.require(:pollution_event).permit(:name, :address, :city, :state, :zip, :description, :offender, :likecount)
  end
end
