class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:id])
  end

  def create
    shelter = Shelter.find(params[:id])
    pet = Pet.new({
      name: params[:name],
      age: params[:age],
      sex: params[:sex],
      description: params[:description],
      shelter_id: shelter.id,
      image: params[:image],
      status: 'Adoptable'
      })
      pet.save
      redirect_to "/shelters/#{shelter.id}/pets"
  end
end
