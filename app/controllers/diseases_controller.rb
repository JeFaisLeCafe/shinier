class DiseasesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:show]

  def show
    @disease = Disease.find(params[:id])
    authorize @disease
  end
end
