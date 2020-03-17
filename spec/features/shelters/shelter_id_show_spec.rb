require 'rails_helper'

RSpec.describe "shelter id page" do
  it "can display shelter information on id page" do
    shelter_1 = Shelter.create!(name: "Denver Animal Shelter",
                               address: "500 Invisible St.",
                               city: "Denver",
                               state: "Colorado",
                               zip: "80201")

  visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end
end
