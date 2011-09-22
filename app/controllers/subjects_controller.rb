# -*- encoding : utf-8 -*-
class SubjectsController < ApplicationController
  # GET /subjects
  # GET /subjects.json
  before_filter :authenticate_admin!, :only=>[:index,:destroy]
  before_filter :authenticate_lector_or_admin, :only=>[:show]
  before_filter :authenticate_user_or_admin, :only=>[:new, :create, :edit, :update]

  
  
  def index
    @subjects = Subject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subjects }
    end
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    @subject = Subject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/new
  # GET /subjects/new.json
  def new
    @subject = Subject.new
    #pokial je prihlaseny user a nie admin, automaticky ho priradi
    if user_signed_in?
      @subject.user=current_user
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subject }
    end
  end

  # GET /subjects/1/edit
  def edit
    @subject = Subject.find(params[:id])
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(params[:subject])
    if (user_signed_in? && !(@subject.users.exists?(current_user)))
      flash[:alert]="Môžeš pridávať len kurzy v ktorých učíš!"
      render :action=> "new"
    else
      respond_to do |format|
        if @subject.save
          format.html { redirect_to @subject, notice: 'Nový kurz bol vytvorený.' }
          format.json { render json: @subject, status: :created, location: @subject }
        else
          format.html { render action: "new" }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /subjects/1
  # PUT /subjects/1.json
  def update
    @subject = Subject.find(params[:id])
    if (user_signed_in? && !(@subject.users.include?(current_user)))
      flash[:alert]="Nemôžeš sa vymazať z kurzu!"
      render :action=> "new"
    else
    params[:subject][:user_ids] ||= []
      respond_to do |format|
        if @subject.update_attributes(params[:subject])
          format.html { redirect_to @subject, notice: 'Kurz bol upravený.' }
          format.json { head :ok }
        else
          format.html { render action: "edit" }
          format.json { render json: @subject.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  
  
    def new_job
    @subject =  Subject.find(params[:id])
  end
  
  

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    respond_to do |format|
      format.html { redirect_to subjects_url }
      format.json { head :ok }
    end
  end
  
  #skuma konkretny predmet
  def authenticate_lector_or_admin
    if admin_signed_in?
      true
    elsif (user_signed_in? && Subject.find(params[:id]).users.exists?(current_user))
      true
    else
      flash[:alert]="Prístup ku kurzu zamietnutý!"
      redirect_to :root
    end
  end
  
  
end
