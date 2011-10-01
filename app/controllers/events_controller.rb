# -*- encoding : utf-8 -*-
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
      @udalosti = Event.where(:zaciatok => @detail..@detail+1.day).order(:zaciatok).group_by(&:user_id)
      @rozvrhy = Event.where(:zaciatok => @detail..@detail+1.day).where("classroom_id is not null").order(:zaciatok).group_by(&:classroom_id)
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
    @rozvrhy = Event.where(:zaciatok => @start..(@start+1.week)).where("user_id is not null").order(:zaciatok).group_by(&:user_id)
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
  
  def planuj_public
    @zaciatok = DateTime.parse(params[:zac])
    @koniec = @zaciatok + (params[:dlzka].to_i*5).minutes
    if @classroom
      @classroom = Classroom.find(params[:classroom_id])
    end
    @rozvrh = Event.where(:zaciatok => @zaciatok.to_date..@zaciatok.to_date+1.day).order(:zaciatok)
    @udalosti_u = @rozvrh.where("user_id is not null").group_by(&:user_id)
    @udalosti_c = @rozvrh.where("classroom_id is not null").group_by(&:classroom_id)
  end
  
  def pridaj_terminy
    
  #ak je oznacene neopakovat, prida len zvolenu 1 hodinu a finito
    if params[:kolko]=="nie"
      if Subject.find(params[:subject_id]).users.count==1
      @event=Event.create(:subject_id=>params[:subject_id], :classroom_id=>params[:classroom_id],
                       :user_id=>Subject.find(params[:subject_id]).users.first, 
                       :zaciatok=>DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i ))
      @event.save
      redirect_to :action=>"udalosti_pridane", :events=>@event 
      else
        redirect_to :action=>"zvol_lektora", :subject_id=>params[:subject_id], 
                  :classroom_id=>params[:classroom_id], :zaciatok=>params[:zaciatok],
                  :kolko=>params[:kolko], :cislo=>params[:cislo], :opakovat=>params[:opakovat]
      end
    else
   @event=Event.new     
    #pokial uci predmet viac lektorov, presmeruj na stranku zvolenia lektora
    if Subject.find(params[:subject_id]).users.count>1 && params[:user_id].nil?
      redirect_to :action=>"zvol_lektora", :subject_id=>params[:subject_id], 
                  :classroom_id=>params[:classroom_id], :zaciatok=>params[:zaciatok],
                  :kolko=>params[:kolko], :cislo=>params[:cislo], :opakovat=>params[:opakovat]
    elsif params[:user_id]
      @event.user_id = User.find(params[:user_id])
    else
      @event.user_id = Subject.find(params[:subject_id]).users.first  
    @event.subject_id = Subject.find(params[:subject_id])
    @event.classroom_id = Classroom.find(params[:classroom_id])
    @event.zaciatok = DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i)
    @events=[]
    @events<<@event
    case params[:kolko]
    when "vsetky" then @kolko=(@event.subject.how_many_hours-@event.subject.events.count-1).to_i #-1 odrata prvu hodinu
    when "polovica" then @kolko=(@event.subject.how_many_hours-@event.subject.events-1).to_i/2
    when "cislo" then @kolko=params[:cislo].to_i
    end
    @kolko=@kolko.to_i
    @opakovat=params[:opakovat].to_i
    @kolko.times do |i|
      #priradi event, cas zaciatku urci ako nasobok opakovacej periody
      @events<<Event.new(:user_id=>@event.user_id, :classroom_id=>@event.classroom_id,
                         :subject_id=>@event.subject_id, 
                         :zaciatok=>DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i)+((i+1)*@opakovat).days )
    end # end @kolko.times / ukladanie zaznamov do rozvrhu
      if @events.each { |event| event.save }
        flash[:notice]="Záznamy boli uložené."
        redirect_to :action=>"udalosti_pridane", :events=>@events
      else
        flash[:alert]="Vyskytla sa nejaká zrada...! Fuj!"
        render :action=>"pridaj_public"
      end   #end if events.save
    end
   end #koniec if params[:kolko]
  end #koniec def pridaj_terminy
  
  def zvol_lektora
    @event = Event.new
    @event.subject_id = params[:subject_id]
    @event.classroom_id = params[:classroom_id]
    @event.zaciatok = DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i)    
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
  
  def udalosti_pridane
    @events = Event.where(:id=>params[:events])
  end

end
