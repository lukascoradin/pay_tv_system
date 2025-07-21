class PackagesController < ApplicationController
  before_action :set_package, only: %i[ show edit update destroy ]

  def index
    @packages = Package.includes(:plan, :additional_services).all
  end

  def show
  end

  def new
    @package = Package.new
  end

  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: "Plan was successfully created." }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: "Package was successfully updated." }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @package.destroy!

    respond_to do |format|
      format.html { redirect_to packages_path, status: :see_other, notice: "Package was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_package
    @package = Package.find(params[:id])
  end

  def package_params
    params.require(:package).permit(:name, :plan_id, :price, additional_service_ids: [])
  end
end
