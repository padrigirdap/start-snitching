class Api::PollutionEventsController < ApiController
  def index
    events = PollutionEvent.all
    render json: { events: events }, status: :ok
  end
end
