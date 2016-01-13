class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event.contact, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render 'contacts/show' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @event = current_user.events.find(params[:id])
  end
  
  def edit
    @event = current_user.events.find(params[:id])
  end
  

  def index
    if params[:date]
      @events = current_user.events.where("date(date) = ?", Date.parse(params[:date]))
    else
      flash[:notice] = "No events today"
      @events = current_user.events
    end
  end

  def destroy
    @events.destroy
  end
  
  def event_params
    params.require(:event).permit(:title, :note, :date, :contact_id)
  end  
end
