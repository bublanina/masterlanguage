# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  before_filter :authenticate_admin!, :except=>[:subjects]
    before_filter :authenticate_lector_or_admin1, :only=>[:subjects]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end


  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'Lektor bol vytvorený.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
    # ak je heslo prazdne, nezmeni povodne
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    # kontrola zmien v priradeniach kurzov
    params[:user][:subject_ids] ||= []
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(users_path, :notice => 'Lektorov účet bol upravený.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def subjects
    @user = User.find(params[:id])
    @subjects=@user.subjects
  end
  
  def add_subject
    @user = User.find(params[:id])
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

    #skuma konkretneho usera
  def authenticate_lector_or_admin1
    if admin_signed_in?
      true
    elsif (user_signed_in? && current_user==User.find(params[:id]))
      true
    else
      flash[:alert]="Prístup ku kurzom lektora zamietnutý!"
      redirect_to :root
    end
  end

end

