class EventsController < ApplicationController
  
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def before_new
    @event = Event.new
    @subjects = []
    Subject.all.each do |subject|
      if subject.events.count < subject.how_many_hours
        @subjects << subject
      end
    end
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    elsif params[:event]
      @subject = Subject.find(params[:event][:subject_id])
    end
    if params[:den]
      @detail = DateTime.parse(params[:den])
      @udalosti = Event.where(:zaciatok => @detail..@detail+1).order(:zaciatok).group_by(&:user_id)
    end
  end
  
  def podla_lektorov
    if params[:start]
      @start = Date.parse(params[:start])-((Date.parse(params[:start])).wday-1).days
    else
      @start = Date.today-Date.today.wday.days+1.day
    end
    @starty = []
    12.times do |i| 
      @starty << Date.today-Date.today.wday+1.day+i.weeks 
    end      
    @rozvrhy = Event.where(:zaciatok => @start..@start+1.week).order(:zaciatok).group_by(&:user_id)
  end
  
  def podla_miestnosti
    if params[:start]
      @start = Date.parse(params[:start])-((Date.parse(params[:start])).wday-1).days
    else
      @start = Date.today-Date.today.wday.days+1.day
    end
    @starty = []
    12.times do |i| 
      @starty << Date.today-Date.today.wday+1.day+i.weeks 
    end
    @rozvrhy = Event.where(:zaciatok => @start..@start+1.week).where("classroom_id is not null").order(:zaciatok).group_by(&:classroom_id)
  end
  
  
  def new
    @event = Event.new
    @subjects = []
    Subject.all.each do |subject|
      if subject.events.count < subject.how_many_hours
        @subjects << subject
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :ok }
    end
  end
  
  def detail
    respond_to do |format|
    format.js
    end
  end

end
