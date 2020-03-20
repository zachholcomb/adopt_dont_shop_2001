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

    click_link("Pets")
    expect(page).to have_css("img[src*='#{pet_1.image}']")
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.age)
    expect(page).to have_content(pet_1.sex)
  end
end
