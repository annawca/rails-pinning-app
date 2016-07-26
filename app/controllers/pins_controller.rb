class PinsController < ApplicationController
  before_action :require_login, except: [:show, :show_by_name]
  
  def index
    @pins = Pin.all
  end
  
  def show
    @pin = Pin.find(params[:id])
    @users = @pin.users
  end
  
  def show_by_name
  	@pin = Pin.find_by_slug(params[:slug])
    @users = @pin.users
  	render :show
  end

  def new
    @pin = Pin.new
  end 

  def create
    @pin = Pin.create(pin_params)

    if @pin.valid?
      @pin.user_id = current_user.id
      @pin.board_id = current_user.pinnings.board_id
      @pin.save
      redirect_to pin_by_name_path(@pin.slug)
    else 
      @errors = @pin.errors
      render :new
    end
  end

  def edit
    @pin = Pin.find(params[:id])
  end

  def edit_by_name
    @pin = Pin.find_by_slug(params[:slug])
    render :edit
  end

  def update
    if Pin.find_by_slug(params[:slug]).nil?
      @pin = Pin.find(params[:id])
    else
      @pin = Pin.find_by_slug(params[:slug])
    end
   
    if @pin.update(pin_params)
      redirect_to pin_by_name_path(@pin.slug)
    else
      @errors = @pin.errors
      render :edit
    end
  end

  def repin
    @pin = Pin.find(params[:id])
    @pin.pinnings.create(user: current_user)
    redirect_to user_path(current_user)
  end

  private

    def pin_params
      params.require(:pin).permit(:title, :url, :slug, :text, :category_id, :image, :user_id)
    end 
end
