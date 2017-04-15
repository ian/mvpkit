require_dependency "admin/application_controller"

module Admin
  class ConversionsController < ApplicationController
    before_action :set_conversion, only: [:show, :edit, :update, :destroy]

    # GET /conversions
    def index
      # @conversions = Conversion.all
      @q = Conversion.ransack(params[:q])
      @conversions = @q.result(distinct: true)
    end

    # GET /conversions/1
    def show
    end

    # GET /conversions/new
    def new
      @conversion = Conversion.new
    end

    # GET /conversions/1/edit
    def edit
    end

    # POST /conversions
    def create
      @conversion = Conversion.new(conversion_params)

      if @conversion.save
        redirect_to @conversion, notice: 'Conversion was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /conversions/1
    def update
      if @conversion.update(conversion_params)
        redirect_to @conversion, notice: 'Conversion was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /conversions/1
    def destroy
      @conversion.destroy
      redirect_to conversions_url, notice: 'Conversion was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_conversion
        @conversion = Conversion.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def conversion_params
        params.require(:conversion).permit(:email)
      end
  end
end
