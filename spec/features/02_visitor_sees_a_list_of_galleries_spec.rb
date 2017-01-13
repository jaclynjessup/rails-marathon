require 'rails_helper'


feature "visitor sees a list of galleries" do
  scenario "sees a list of galleries with no deatils as links, and a link for new gallery" do
    Gallery.create(name: "The Guggenheim", city: "New York", state: "NY", zip: "10128")
    Gallery.create(name: "MFA", city: "Boston", state: "MA", zip: "02155")

    visit galleries_path

    expect(page).to have_content "The Guggenheim"
    expect(page).to have_link "MFA"
    expect(page).to_not have_content "Boston"

    click_link "Add New Gallery"

    expect(page).to have_content "New Gallery Form"
  end

  scenario "clicks link and is taken to show page for given gallery" do
    Gallery.create(name: "MFA", city: "Boston", state: "MA", zip: "02155", description: "Best gallery in Boston!")
    visit root_path

    click_link "MFA"

    expect(page).to have_content "MFA"
    expect(page).to have_content "Boston"
    expect(page).to have_content "MA"
    expect(page).to have_content "02155"
    expect(page).to have_content "Best gallery in Boston!"
  end
end
