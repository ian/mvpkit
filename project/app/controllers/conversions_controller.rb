class ConversionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @conversion = Conversion.new(conversion_params)

    respond_to do |format|
      if @conversion.save
        sign_in(@conversion)
        track! 'Conversion', {email: @conversion.email}
        slack! "Conversion: #{@conversion.email}"
        format.json { render json: @conversion, status: :ok }
      else
        format.json { render json: @conversion.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def conversion_params
    params.require(:conversion).permit(:email)
  end
end
