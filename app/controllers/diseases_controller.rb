class DiseasesController < ApplicationController
  def show
    @disease = Disease.find(params[:id])
  end
end
