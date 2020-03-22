require 'rails_helper'

RSpec.describe "Shelter's pets index", type: :feature do
  it "can show each pet that the shelter has" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                              address: "500 Invisible St.",
                              city: "Denver",
                              state: "Colorado",
                              zip: "80201")


    pet_1 = Pet.create(image: 'app/assets/images/border_collie.jpg',
                    name: 'Rover',
                    age: 3,
                    sex: "Male",
                    shelter: shelter_1,
                    description: "He's a biter.",
                    status: "Pending")

    visit "/shelters/#{shelter_1.id}"

    click_link("Shelter Pets")
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
  end

  it "has a link to update each pet" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'https://image.shutterstock.com/z/stock-photo-attentive-border-collie-dog-lying-down-on-the-grass-on-a-sunny-d-593634296.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Good dog, very active",
                     status: "Adoptable")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_link('Update Pet')
    click_link('Update Pet')
    expect(page).to have_current_path("/pets/#{pet.id}/edit")
  end

  it "has a link to delete each pet" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'https://image.shutterstock.com/z/stock-photo-attentive-border-collie-dog-lying-down-on-the-grass-on-a-sunny-d-593634296.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Good dog, very active",
                     status: "Adoptable")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_link('Delete Pet')
    click_link('Delete Pet')
    expect(page).to have_current_path("/pets")
    expect(page).to_not have_content('Rover')
  end

  it "has a link to each pet's show page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'https://image.shutterstock.com/z/stock-photo-attentive-border-collie-dog-lying-down-on-the-grass-on-a-sunny-d-593634296.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Good dog, very active",
                     status: "Adoptable")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_link("#{pet.name}")
    click_link("#{pet.name}")
    expect(page).to have_current_path("/pets/#{pet.id}")
  end

  it "can link to the pets index page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'https://image.shutterstock.com/z/stock-photo-attentive-border-collie-dog-lying-down-on-the-grass-on-a-sunny-d-593634296.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Good dog, very active",
                     status: "Adoptable")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_link("All Pets")
    click_link("All Pets")
    expect(page).to have_current_path("/pets")
  end

  it "can link to the shelters index page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    pet = Pet.create!(image: 'https://image.shutterstock.com/z/stock-photo-attentive-border-collie-dog-lying-down-on-the-grass-on-a-sunny-d-593634296.jpg',
                     name: 'Rover',
                     age: 3,
                     sex: "Male",
                     shelter: shelter_1,
                     description: "Good dog, very active",
                     status: "Adoptable")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_link("All Shelters")
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters")
  end

  it "can show count of pets at the shelter" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                              address: "500 Invisible St.",
                              city: "Denver",
                              state: "Colorado",
                              zip: "80201")

    pet_1 = Pet.create(image: 'app/assets/images/border_collie.jpg',
                    name: 'Rover',
                    age: 3,
                    sex: "Male",
                    shelter: shelter_1,
                    description: "He's a biter.",
                    status: "Pending")

    pet_2 = Pet.create(image: 'app/assets/images/border_collie.jpg',
                    name: 'Rover',
                    age: 3,
                    sex: "Male",
                    shelter: shelter_1,
                    description: "He's a biter.",
                    status: "Pending")

    visit "/shelters/#{shelter_1.id}/pets"
    expect(page).to have_content "Pet Count:"
    expect(page).to have_content(2)
  end
end
