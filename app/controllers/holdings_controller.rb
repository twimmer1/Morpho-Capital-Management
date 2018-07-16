class HoldingsController < ApplicationController


  before_action :authenticate_user!, only: [:index, :show]

  def new
  	@holding = Holding.new
  end

  def create
  	@holding = Holding.new(holding_params)
  	if @holding.save
  		redirect_to @holding
  	else
  		render 'new'
  	end
  end

  def show
  	@holding = Holding.find(params[:id])
    zurl = Rails.configuration.maps.zurl
    zid = Rails.configuration.maps.zil_key
    zzip = @holding.zip
    zaddress = "#{@holding.address} #{@holding.city} #{@holding.state} #{@holding.zip}".gsub(' ','+')
    response = HTTParty.get("#{zurl}?zws-id=#{zid}&citystatezip=#{zzip}&address=#{zaddress}")
    pr = response.parsed_response
    zrsp = pr['searchresults']
    if zrsp.key?('response')
      results = zrsp['response']['results']
      zestimate = results['result']['zestimate']['amount']['__content__']
    else
      zestimate = 'unknown'  
    end

    params[:zestimate] = zestimate
  end

  def index
  	@holdings = Holding.all
  end

  def edit
  	@holding = Holding.find(params[:id])
  end

  def update
  	@holding = Holding.find(params[:id])
  	if @holding.update(holding_params)
  		redirect_to @holding
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@holding = Holding.find(params[:id])
  	@holding.destroy

  	redirect_to holdings_path
  end

  private
  	def holding_params
  		params.require(:holding).permit(:address, :city, :state, :zip, :description)
  	end


end
