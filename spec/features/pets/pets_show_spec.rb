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
                     shelter: shelter_1,
                     description: "Great Dog",
                     status: "Adoptable")

    visit "pets/#{pet.id}"

    expect(page).to have_css("img[src*='#{pet.image}']")
    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.description)
    expect(page).to have_content(pet.status)
  end

  it "can link to itself" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'app/assets/images/border_collie.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Great Dog",
                     status: "Adoptable")

    visit "pets/#{pet.id}"
    expect(page).to have_link("#{pet.name}")
    click_link("#{pet.name}")
    expect(page).to have_current_path("/pets/#{pet.id}")
  end

  it "can link to pets index page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'app/assets/images/border_collie.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Great Dog",
                     status: "Adoptable")

    visit "pets/#{pet.id}"
    expect(page).to have_link("All Pets")
    click_link("All Pets")
    expect(page).to have_current_path("/pets")
  end

  it "can link to shelters index page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'app/assets/images/border_collie.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Great Dog",
                     status: "Adoptable")

    visit "pets/#{pet.id}"
    expect(page).to have_link("All Shelters")
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters")
  end

  it "has a link to change adoptable pets adoption status to pending" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'app/assets/images/border_collie.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Great Dog",
                     status: "Adoptable")

    visit "pets/#{pet.id}"
    click_link("Change to Adoption Pending")
    expect(page).to have_content("Pending Adoption")
  end

  it "has a link to change pending pets adoption status to adoptable" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'app/assets/images/border_collie.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Great Dog",
                     status: "Pending Adoption")

    visit "pets/#{pet.id}"
    click_link("Change to Adoptable")
    expect(page).to have_content("Adoptable")
  end
end
