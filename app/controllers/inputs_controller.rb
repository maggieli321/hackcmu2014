class InputsController < ApplicationController
  before_action :set_input, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:new, :edit, :update, :destroy]
  # GET /inputs
  # GET /inputs.json
  def index
    @upcoming_inputs = Camp.upcoming.chronological
    @rot_inputs = Camp.past.chronological

  end

  def show
    @upcoming_inputs = Camp.upcoming.chronological
    @rot_inputs = Camp.past.chronological
    @hash = Gmaps4rails.build_markers(@camp.location) do |location, marker|
    marker.lat location.latitude
    marker.lng location.longitude
    end
  end

  def new
    
    @camp = Camp.new
    authorize! :new, @camp
  end

  def edit
    authorize! :edit, @camp
  end

  def create
    authorize! :create, @camp
    @camp = Camp.new(camp_params)
    if @camp.save
      redirect_to @camp, notice: "The camp #{@camp.name} (on #{@camp.start_date.strftime('%m/%d/%y')}) was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    authorize! :update, @camp
    if @camp.update(camp_params)
      redirect_to @camp, notice: "The camp #{@camp.name} (on #{@camp.start_date.strftime('%m/%d/%y')}) was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize! :destroy, @camp
    @camp.destroy
    redirect_to camps_url, notice: "#{@camp.name} camp on #{@camp.start_date.strftime('%m/%d/%y')} was removed from the system."
  end

  private
    def set_camp
      @camp = Camp.find(params[:id])
    end

    def camp_params
      params.require(:camp).permit(:curriculum_id, :location_id, :cost, :start_date, :end_date, :time_slot, :max_students, :active, :instructor_ids => [])
    end
end
