require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can list all pets on pets index page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'https://image.shutterstock.com/z/stock-photo-attentive-border-collie-dog-lying-down-on-the-grass-on-a-sunny-d-593634296.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1)
    visit '/pets'
    expect(page).to have_css("img[src*='#{pet.image}']")
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(shelter_1.name)
  end
end
