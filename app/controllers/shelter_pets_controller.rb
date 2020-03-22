class ShelterPetsController < ApplicationController

  def index
    @shelter = Shelter.find(params[:id])
    @pets = @shelter.pets.find_adoptable
  end
end
