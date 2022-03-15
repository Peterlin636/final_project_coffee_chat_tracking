class ConsultantsController < ApplicationController
  before_action :set_consultant, only: %i[show edit update destroy]

  def index
    @q = Consultant.ransack(params[:q])
    @consultants = @q.result(distinct: true).includes(:coffee_chats,
                                                      :company).page(params[:page]).per(10)
  end

  def show
    @coffee_chat = CoffeeChat.new
  end

  def new
    @consultant = Consultant.new
  end

  def edit; end

  def create
    @consultant = Consultant.new(consultant_params)

    if @consultant.save
      message = "Consultant was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @consultant, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @consultant.update(consultant_params)
      redirect_to @consultant, notice: "Consultant was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @consultant.destroy
    message = "Consultant was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to consultants_url, notice: message
    end
  end

  private

  def set_consultant
    @consultant = Consultant.find(params[:id])
  end

  def consultant_params
    params.require(:consultant).permit(:company_id, :title, :office,
                                       :phone_number)
  end
end
