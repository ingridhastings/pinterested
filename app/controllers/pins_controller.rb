class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

# authenticates a user for every page of the app except index and show
  before_action :authenticate_user!, except: [:index, :show]

# makes sure only the correct user can edit, update or destroy a pin
  before_action :correct_user, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: "Pin was successfully created"
    else
      render action: 'new'
    end
  end


  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.'
      else
        ender :edit
      end
  end



  def destroy
    @pin.destroy
      redirect_to pins_url, notice: 'Pin was successfully destroyed.'
  end


  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description)
    end

# current_user is a Devise helper that references who the current logged in user is
# lets the db know that a specific pin belongs to a specific user
    def correct_user
      @pin = current_user.pins.find_by(id:params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end
end
