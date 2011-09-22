# -*- encoding : utf-8 -*-
class BuyersController < ApplicationController
  # GET /buyers
  # GET /buyers.json
  before_filter :authenticate_user_or_admin, :except=>[:destroy]
  before_filter :authenticate_admin!, :only=>[:destroy]
  
  
  def index
    @buyers = Buyer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @buyers }
    end
  end

  # GET /buyers/1
  # GET /buyers/1.json
  def show
    @buyer = Buyer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buyer }
    end
  end

  # GET /buyers/new
  # GET /buyers/new.json
  def new
    @buyer = Buyer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buyer }
    end
  end

  # GET /buyers/1/edit
  def edit
    @buyer = Buyer.find(params[:id])
  end

  # POST /buyers
  # POST /buyers.json
  def create
    @buyer = Buyer.new(params[:buyer])

    respond_to do |format|
      if @buyer.save
        format.html { redirect_to @buyer, notice: 'Buyer was successfully created.' }
        format.json { render json: @buyer, status: :created, location: @buyer }
      else
        format.html { render action: "new" }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /buyers/1
  # PUT /buyers/1.json
  def update
    @buyer = Buyer.find(params[:id])

    respond_to do |format|
      if @buyer.update_attributes(params[:buyer])
        format.html { redirect_to @buyer, notice: 'Buyer was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @buyer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buyers/1
  # DELETE /buyers/1.json
  def destroy
    @buyer = Buyer.find(params[:id])
    @buyer.destroy

    respond_to do |format|
      format.html { redirect_to buyers_url }
      format.json { head :ok }
    end
  end
end
