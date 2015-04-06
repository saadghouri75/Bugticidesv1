class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show, :search, :search_results]
  # GET /properties
  # GET /properties.json
  def index
    order_params = params[:order]
    if order_params == 'date'
      @properties = Property.where(:sold_flag => false)
      @active = 'date'
    elsif order_params == 'price'
      @properties = Property.where(:sold_flag => false).order(:price_max)
      @active = 'price'
    else
      @properties = Property.where(:sold_flag => false)
      @active = 'date'
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @bid = PropertyBid.where(:property_id => @property.id)
    @bid_count = @bid.count
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id
    @property.status = 'open'
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_properties
    @properties = Property.where(:user_id => current_user.id)
  end

  def search
  end

  def search_results
    area = params[:area]
    postal_code = params[:postal_code]
    city = params[:city]
    province = params[:province]
    property_type = params[:property_type]
    size = params[:size]
    min_price = params[:min_price]
    max_price = params[:max_price]
    age = params[:age]
    @properties = Property.where('area LIKE ? OR postal_code LIKE ? OR city LIKE ? OR province LIKE ? OR property_type LIKE ? OR size LIKE ? OR price_min LIKE ? OR price_max LIKE ? OR age LIKE ?',area, postal_code, city, province, property_type, size, min_price, max_price, age)
  end
  
  def sold
    @property = Property.find(params[:id])
    @property.status = 'sold'
    @property.sold_at = DateTime.now
    @property.save
    redirect_to my_properties_properties_path
  end

  def bid
    bid = params[:bid]
    property = params[:property]
    user = params[:user]
    PropertyBid.create(:bid => bid, :user_id => user, :property_id => property)
    @property = Property.find(property)
    PropertyMailer.bid_informer(@property.user,bid).deliver
    redirect_to property_path(property)
  end

  def book_appointment
    message = params[:message]
    availability = params[:availability]
    PropertyMailer.book_appointment(current_user,availability,message).deliver
    redirect_to home_user_dashboard_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params[:property].permit(:title, :description, :area, :postal_code, :city, :province, :image, :user_id, :property_type, :size, :price_min, :price_max, :age, :sold_at, :status, :approved, :facilities => [])
    end
end
