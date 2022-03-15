class ConsultantsController < ApplicationController
  before_action :set_consultant, only: %i[show edit update destroy]

  # GET /consultants
  def index
    @q = Consultant.ransack(params[:q])
    @consultants = @q.result(distinct: true).includes(:coffee_chats,
                                                      :company).page(params[:page]).per(10)
  end

  # GET /consultants/1
  def show
    @coffee_chat = CoffeeChat.new
  end

  # GET /consultants/new
  def new
    @consultant = Consultant.new
  end

  # GET /consultants/1/edit
  def edit; end

  # POST /consultants
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

  # PATCH/PUT /consultants/1
  def update
    if @consultant.update(consultant_params)
      redirect_to @consultant, notice: "Consultant was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /consultants/1
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

  # Use callbacks to share common setup or constraints between actions.
  def set_consultant
    @consultant = Consultant.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def consultant_params
    params.require(:consultant).permit(:company_id, :title, :office,
                                       :phone_number)
  end
end
