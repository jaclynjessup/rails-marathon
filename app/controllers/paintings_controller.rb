class PaintingsController < ApplicationController
  def index
    @gallery = Gallery.find(params[:gallery_id])
    @paintings = @gallery.paintings
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @painting = Painting.new
  end

  def create
   @gallery = Gallery.find(params[:gallery_id])
   @painting = Painting.new(params_strong)
   @painting.gallery = @gallery
   if @painting.save
     flash[:notice] = "Painting added successfully"
     redirect_to gallery_path(@gallery)
   else
     flash[:notice] = @painting.errors.full_messages.to_sentence
     render '/paintings/new'
   end
 end

 private
  def params_strong
    params.require(:painting).permit(
      :title,
      :artist,
      :year
    )
  end
end
