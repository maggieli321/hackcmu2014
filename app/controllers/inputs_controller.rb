class InputsController < ApplicationController
  before_action :set_input, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:new, :edit, :update, :destroy]
  authorize_resource
  # GET /inputs
  # GET /inputs.json
  def index
    @upcoming_inputs = Input.upcoming.chronological
    @rot_inputs = Input.past.chronological
    @inputorder = Input.chronological
    @quality = ['Excellent','Ok','Bad']

  end

  def show
    @upcoming_inputs = Input.upcoming.chronological
    @rot_inputs = Input.past.chronological
    # @hash = Gmaps4rails.build_markers(@camp.location) do |location, marker|
    # marker.lat location.latitude
    # marker.lng location.longitude
  end

  def new
    @input = Input.new
    @input.user_id = current_user.id
    authorize! :new, @input
  end

  def edit
    authorize! :edit, @input
  end

  def create
    authorize! :create, @input
    @input = Input.new(input_params)
    if @input.save
      redirect_to @input, notice: "The nom #{@input.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    authorize! :update, @input
    if @input.update(input_params)
      redirect_to @input, notice: "The nom #{@input.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize! :destroy, @input
    @input.destroy
    redirect_to inputs_url, notice: "The nom #{@input.name} was removed from the system."
  end

  private
    def set_input
      @input = Input.find(params[:id])
    end

    def input_params
      params.require(:input).permit(:food_id, :user_id, :date, :quality, :name, :exp_date, :num_days)
    end
end
