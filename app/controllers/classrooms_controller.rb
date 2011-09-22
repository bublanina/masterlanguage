# -*- encoding : utf-8 -*-
class ClassroomsController < ApplicationController
  # GET /classrooms
  # GET /classrooms.json
  before_filter :authenticate_admin!
  
  def index
    @classrooms = Classroom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @classrooms }
    end
  end

  # GET /classrooms/1
  # GET /classrooms/1.json
  def show
    @classroom = Classroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/new
  # GET /classrooms/new.json
  def new
    @classroom = Classroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @classroom }
    end
  end

  # GET /classrooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
  end

  # POST /classrooms
  # POST /classrooms.json
  def create
    @classroom = Classroom.new(params[:classroom])

    respond_to do |format|
      if @classroom.save
        format.html { redirect_to @classroom, notice: 'Miestnosť bola vytvorená.' }
        format.json { render json: @classroom, status: :created, location: @classroom }
      else
        format.html { render action: "new" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /classrooms/1
  # PUT /classrooms/1.json
  def update
    @classroom = Classroom.find(params[:id])
  params[:classroom][:user_ids] ||= []
    respond_to do |format|
      if @classroom.update_attributes(params[:classroom])
        format.html { redirect_to @classroom, notice: 'Údaje o miestnosti boli upravené.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @classroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classrooms/1
  # DELETE /classrooms/1.json
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to classrooms_url }
      format.json { head :ok }
    end
  end
end
