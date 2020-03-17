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
end
