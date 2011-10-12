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
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
    end
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
    @rozvrh = Event.where(:zaciatok => @zaciatok.to_date..@zaciatok.to_date+1.day).order(:zaciatok)
    @udalosti_u = @rozvrh.where("user_id is not null").group_by(&:user_id)
    @udalosti_c = @rozvrh.where("classroom_id is not null").group_by(&:classroom_id)
  end
  
  def pridaj_terminy
  #ak je oznacene neopakovat, prida len zvolenu 1 hodinu a finito
    if params[:kolko] && params[:kolko]=="nie" #1
      if params[:user_id] #2 ak je zadany lektor, hned ho prida
              @event=Event.new(:subject_id=>params[:subject_id], :classroom_id=>params[:classroom_id],
                       :user_id=>params[:user_id], 
                       :zaciatok=>DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i ),
                       :status=>"riadna")
      
           if preskumaj_event(@event)==true
            @event.save
            redirect_to :action=>"udalosti_pridane", :events=>@event 
            else 
              redirect_to :back#render :action=>"planuj_public", :zac=>params[:zaciatok]
            end
        #2.1
      elsif Subject.find(params[:subject_id]).users.count==1 # ak je lektor len 1, prida ho
      @event=Event.new(:subject_id=>params[:subject_id], :classroom_id=>params[:classroom_id],
                       :user_id=>Subject.find(params[:subject_id]).users.first.id, 
                       :zaciatok=>DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i ),
                       :status=>"riadna")
           if preskumaj_event(@event)==true
            @event.save
            redirect_to :action=>"udalosti_pridane", :events=>@event 
           else 
              redirect_to :back#render :action=>"planuj_public", :zac=>@event.zaciatok
           end
      else #2.2 inak nasmeruje na zvolenie lektora
        redirect_to :action=>"zvol_lektora", :subject_id=>params[:subject_id], 
                  :classroom_id=>params[:classroom_id], :zaciatok=>params[:zaciatok],
                  :kolko=>params[:kolko], :cislo=>params[:cislo], :opakovat=>params[:opakovat]
      end  #koniec priradovania hodiny bez opakovania
      #else k if params[:kolko]
    else #1.2 v pripade ze je zadane opakovanie hodin ide sem
   @event=Event.new     
    #2.1 pokial uci predmet viac lektorov, presmeruj na stranku zvolenia lektora
    if Subject.find(params[:subject_id]).users.count>1 && params[:user_id].nil?
      redirect_to :action=>"zvol_lektora", :subject_id=>params[:subject_id], 
                  :classroom_id=>params[:classroom_id], :zaciatok=>params[:zaciatok],
                  :kolko=>params[:kolko], :cislo=>params[:cislo], :opakovat=>params[:opakovat]
    else #2.2 ak je pocet lektorov 1 alebo bol lektor zadany, prirad
      if params[:user_id] # ak bol zadany lektor, automaticky ho prirad
        @event.user_id = params[:user_id]
      else
        @event.user_id = Subject.find(params[:subject_id]).users.first.id
      end  
    @event.subject_id = params[:subject_id]
    @event.classroom_id = params[:classroom_id]
    @event.zaciatok = DateTime.new(params[:zaciatok][:year].to_i,
                                      params[:zaciatok][:month].to_i,
                                      params[:zaciatok][:day].to_i,
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i)
    @event.status="riadna"
           # ak prvy event nie je v kolizii, pokracuj v pridavani                           
         if preskumaj_event(@event)==true
    @events=[] #vytvor pole pre eventy
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
                                      params[:zaciatok][:day].to_i+((i+1)*@opakovat),#pripocita dni ku dnom
                                      params[:zaciatok][:hour].to_i,
                                      params[:zaciatok][:minute].to_i),
                         :status=>"riadna")
    end # end @kolko.times / ukladanie zaznamov do rozvrhu
    @kolizie = []
      @events.each do |event|  
            if preskumaj_event(event)==true
              event.save 
            else 
              @kolizie<<event
              event.delete
            end
        end 
        if !(@kolizie.empty?)
          flash[:alert]="Nie všetky dátumy boli uložené - vyskytlo sa niekoľko kolízií (pozri dole)."
        end
        flash[:notice]="Záznamy boli uložené."
        redirect_to :action=>"udalosti_pridane", :events=>@events, :kolizie=>@kolizie
   # ak ma prvy event koliziu, nepokracuj
   else 
              redirect_to :back#render :action=>"planuj_public", :zac=>@event.zaciatok
    end
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
    @event.status="riadna"    
  end
  
  def presun_event
    
  end
  
  def presun
    
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
    @event.status="riadna"

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

def preskumaj_event(event1)
    stav = true
        if (6..20).include?(event1.zaciatok.hour)
        Event.where(:zaciatok=>event1.zaciatok.to_date..event1.zaciatok.to_date+1.day).each do |event|
          #skuma ci sa nejaky event prekryva
            if event1.zaciatok<(event.zaciatok+event.subject.mins_per_hour.minutes)&&(event1.zaciatok+event1.subject.mins_per_hour.minutes)>event.zaciatok
              #ak sa event prekryva, skuma ci uz lektor neuci
              if event.user==event1.user
                flash[:alert]="Kolízia - lektor už v tom čase učí."
                stav=false
              #skuma ci je volna miestnost
              elsif event1.classroom.id!=1 && event.classroom==event1.classroom
                flash[:alert]="Kolízia - miestnosť obsadená."
                stav=false
              end #end skumani  
            end #end prekryvajucich sa eventov
        end # end each do
        else
          flash[:alert]="Hodina je mimo rozsahu výučby(6:00-21:00)."
          stav = false
        end #end if / kontrola ci je hodina vo vyucbovom case
        # kontrola ci ma subject
        if event1.subject.users.count==0
          flash[:alert]="Chyba - kurzu musí byť priradený aspoň 1 lektor."
          stav=false
        end
        if !(event1.user.classrooms.include?(event1.classroom)||event1.classroom_id==1 )
          flash[:alert]="Chyba - zvolená miestnosť nie je viditeľná pre zvoleného lektora."
          stav=false
        end
        
        return stav   
end


end
