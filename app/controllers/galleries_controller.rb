class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
    @paintings = Painting.where(gallery_id: params[:id])
    @paintings = @gallery.paintings
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(params_strong)
    if @gallery.save
      flash[:notice] = "Gallery added successfully"
      redirect_to gallery_path(@gallery)
    else
      flash[:notice] = @gallery.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def params_strong
    params.require(:gallery).permit(
      :name,
      :city,
      :state,
      :zip,
      :description
    )
  end
end
