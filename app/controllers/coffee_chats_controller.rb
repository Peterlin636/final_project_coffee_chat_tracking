class CoffeeChatsController < ApplicationController
  before_action :set_coffee_chat, only: [:show, :edit, :update, :destroy]

  # GET /coffee_chats
  def index
    @coffee_chats = CoffeeChat.all
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
      redirect_to @coffee_chat, notice: 'Coffee chat was successfully created.'
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
    redirect_to coffee_chats_url, notice: 'Coffee chat was successfully destroyed.'
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
