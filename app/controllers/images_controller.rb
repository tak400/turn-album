class ImagesController < ApplicationController
  def show
    @images = Image.all
  end

  def create
    @image = Image.new(permit_params)
    @image.save!
    redirect_to action: 'show'
  end

  private

  def permit_params
    params.require(:image).permit(:name, :image)
  end

end
