class CoffeeChatsController < ApplicationController
  before_action :set_coffee_chat, only: [:show, :edit, :update, :destroy]

  # GET /coffee_chats
  def index
    @q = CoffeeChat.ransack(params[:q])
    @coffee_chats = @q.result(:distinct => true).includes(:consultant).page(params[:page]).per(10)
  end

  # GET /coffee_chats/1
  def show
  end

  # GET /coffee_chats/new
  def new
    @coffee_chat = CoffeeChat.new
  end

  # GET /coffee_chats/1/edit
  def edit
  end

  # POST /coffee_chats
  def create
    @coffee_chat = CoffeeChat.new(coffee_chat_params)

    if @coffee_chat.save
      message = 'CoffeeChat was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @coffee_chat, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /coffee_chats/1
  def update
    if @coffee_chat.update(coffee_chat_params)
      redirect_to @coffee_chat, notice: 'Coffee chat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coffee_chats/1
  def destroy
    @coffee_chat.destroy
    message = "CoffeeChat was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to coffee_chats_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coffee_chat
      @coffee_chat = CoffeeChat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def coffee_chat_params
      params.require(:coffee_chat).permit(:location, :consultant_id, :time, :followup_email, :goal_of_the_chat)
    end
end
