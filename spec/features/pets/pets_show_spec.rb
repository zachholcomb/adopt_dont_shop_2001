require 'rails_helper'

RSpec.describe "pet show page", type: :feature do
  it "can show individual pets by id" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'app/assets/images/border_collie.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1)

    visit "pets/#{pet.id}"

    expect(page).to have_css("img[src*='#{pet.image}']")
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.shelter.id)
  end
end
