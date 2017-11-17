class AttractionsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def index
  	@attractions = Attraction.all
  end

  def show
  	@attraction = Attraction.find(params[:id])
  end

  def new
  	@attraction = Attraction.new
  end

  def create
  	@attraction = Attraction.new(attraction_params)

  	if @attraction.save
  		redirect_to attraction_path(@attraction)
  	else
  		redirect_to :new
  	end
  end

  def edit
  	@attraction = Attraction.find(params[:id])
  end

  def update
  	@attraction = Attraction.find(params[:id])

  	if @attraction.update(attraction_params)
  		redirect_to attraction_path(@attraction)
  	else
  		redirect_to :edit
  	end
  end

  def go_on_ride
  	@attraction = Attraction.find(params[:id])
  	@ride = Ride.new(user_id: current_user.id, attraction_id: @attraction.id)

    message = @ride.take_ride

  	if @ride.save && message == 'success'
  		flash[:message] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(current_user)
  	else
  		flash[:alert] = message
      render :show
  	end
  end

  private

  def attraction_params
  	params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end

