class PicturesController < ApplicationController
  def show
    @pictures = Picture.all
  end

  def create
    @picture = Picture.new(permit_params)
    @picture.save!
    redirect_to action: 'show'
  end

  private

  def permit_params
    params.require(:picture).permit(:name, :picture)
  end

end
