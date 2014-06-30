class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  
  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
  end

  def showsearch

  end
  # GET /cars/1
  # GET /cars/1.json
  def show
    @galleries = Gallery.all.where(car_id: params[:id])
    @user = current_user
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  def search
    if (params[:car].present?) 
      @cars = Car.filtr_brand(params[:car][:brand]) unless params[:car][:brand].empty?                            
      @cars = @cars.filtr_model(params[:car][:model]) unless params[:car][:model].empty? 
      @cars= @cars.price(params[:car][:min], params[:car][:max])  unless (params[:car][:min].empty? or params[:car][:max].empty? )                        
      
    end    
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @car }
      else
        format.html { render action: 'new' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to new_gallery_path(@car), notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:brand,  :model, :engine,  :year,  :milage,  :gearcase,  :type,  :fuel,  :doors,  :stan,  :broken,  :color,  :power, :description, :info, :equipment, :price, :photo)      
    end
    
end
