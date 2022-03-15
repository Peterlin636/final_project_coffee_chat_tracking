class CoffeeChatsController < ApplicationController
  before_action :set_coffee_chat, only: %i[show edit update destroy]

  def index
    @q = CoffeeChat.ransack(params[:q])
    @coffee_chats = @q.result(distinct: true).includes(:consultant).page(params[:page]).per(10)
  end

  def show; end

  def new
    @coffee_chat = CoffeeChat.new
  end

  def edit; end

  def create
    @coffee_chat = CoffeeChat.new(coffee_chat_params)

    if @coffee_chat.save
      message = "CoffeeChat was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @coffee_chat, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @coffee_chat.update(coffee_chat_params)
      redirect_to @coffee_chat, notice: "Coffee chat was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @coffee_chat.destroy
    message = "CoffeeChat was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to coffee_chats_url, notice: message
    end
  end

  private

  def set_coffee_chat
    @coffee_chat = CoffeeChat.find(params[:id])
  end

  def coffee_chat_params
    params.require(:coffee_chat).permit(:consultant_id, :time,
                                        :followup_email, :goal_of_the_chat, :location)
  end
end
