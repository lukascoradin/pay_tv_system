class AdditionalServicesController < ApplicationController
  before_action :set_additional_service, only: %i[ show edit update destroy ]

  def index
    @additional_services = AdditionalService.all
  end

  def show
  end

  def new
    @additional_service = AdditionalService.new
  end

  def edit
  end

  def create
    @additional_service = AdditionalService.new(additional_service_params)

    respond_to do |format|
      if @additional_service.save
        format.html { redirect_to @additional_service, notice: "Additional service was successfully created." }
        format.json { render :show, status: :created, location: @additional_service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @additional_service.update(additional_service_params)
        format.html { redirect_to @additional_service, notice: "Additional service was successfully updated." }
        format.json { render :show, status: :ok, location: @additional_service }
      else 
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @additional_service.destroy!

    respond_to do |format|
      format.html { redirect_to additional_services_path, status: :see_other, notice: "Additional services was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_additional_service
      @additional_service = AdditionalService.find(params[:id])
    end

    def additional_service_params
      params.require(:additional_service).permit(:name, :price)
    end
end