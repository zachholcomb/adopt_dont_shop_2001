require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see the names of all shelters" do
    shelter_1 = Shelter.create(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    shelter_2 = Shelter.create(name: "Boulder Animal Shelter",
                              address: "500 Arapahoe St.",
                              city: "Boulder",
                              state: "Colorado",
                              zip: "80777")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "can link to the new page from index" do
    visit "/shelters"

    expect(page).to have_link("New Shelter")

    click_link("New Shelter")

    expect(page).to have_content('Name:')
    expect(page).to have_content('Address:')
    expect(page).to have_content('City:')
    expect(page).to have_content('State:')
    expect(page).to have_content('Zip:')
  end

  it "can link to update page" do
    shelter_1 = Shelter.create(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

    visit "/shelters"
    expect(page).to have_link('Update Shelter')
    click_link('Update Shelter')
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/edit")
  end

  it "can delete shelters from index page" do
    shelter_1 = Shelter.create(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")


    visit "/shelters"
    expect(page).to have_link("Delete Shelter")
    click_link('Delete Shelter')
    expect(page).to_not have_content("Denver Animal Shelter")

    shelter_1 = Shelter.create(name: "Denver Animal Shelter",
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


    visit "/shelters"
    expect(page).to have_link("Delete Shelter")
    click_link('Delete Shelter')
    expect(page).to_not have_content("Denver Animal Shelter")
  end

  it "can link to pets index page" do
    visit "/shelters"
    expect(page).to have_link("All Pets")
    click_link("All Pets")
    expect(page).to have_current_path("/pets")
  end

  it "can link to itself" do
    visit "/shelters"
    expect(page).to have_link("All Shelters")
    click_link("All Shelters")
    expect(page).to have_current_path("/shelters")
  end
end
