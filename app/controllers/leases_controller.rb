class LeasesController < ApplicationController

	 before_action :authenticate_user!, only: [:index, :show]

	def create
		@holding = Holding.find(params[:holding_id])
		@lease = @holding.leases.create(lease_params)
		redirect_to holding_path(@holding)
	end

	def index
		@leases = Lease.all
	end

  def edit
  	@lease = Lease.find(params[:id])
  end

  def update
  	@lease = Lease.find(params[:id])
  	if @lease.update(lease_params)
  		redirect_to @lease
  	else
  		render 'edit'
  	end
  end

	def show
		@lease = Lease.find(params[:id])
	end

	def destroy
  	@lease = Lease.find(params[:id])
  	@lease.destroy

  	redirect_to leases_path
  end

	private
	def lease_params
		params.require(:lease).permit(:rent, :start_date, :end_date, :security_deposit, :conditions)
	end

end