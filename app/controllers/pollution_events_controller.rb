class PollutionEventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  helper_method :resource

  def index
    @pollution_events = PollutionEvent.order(id: :desc)
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
      redirect_to root_path
    else
      flash.now[:error] = @pollution_event.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @pollution_event = PollutionEvent.find(params[:id])
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
    params.require(:pollution_event).permit(:title, :address, :description, :url, :likecount, :event_lng, :event_lat)
  end
end
