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

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:name],
      age: params[:age],
      sex: params[:sex],
      image: params[:image],
      description: params[:description],
      status: pet.status,
      shelter_id: pet.shelter_id
      })
      pet.save
      redirect_to "/pets/#{pet.id}"
  end
end
