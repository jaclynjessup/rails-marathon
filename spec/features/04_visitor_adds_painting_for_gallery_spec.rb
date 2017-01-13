require 'rails_helper'

feature "visitors can add paintings for galleries" do
  scenario "adds a painting for a gallery successfully" do
    mfa = Gallery.create(name: "MFA", city: "Boston", state: "MA", zip: "02155")

    visit new_gallery_painting_path(mfa)

    expect(page).to have_content "Painting Form for MFA"

    fill_in "Title", with: "Snow at Argenteuil"
    fill_in "Year", with: "1874"
    fill_in "Artist", with: "Claude Monet"
    click_button "Add Painting"

    expect(page).to have_content "Painting added successfully"
    expect(page).to have_content "Snow at Argenteuil"
    expect(page).to have_content mfa.city
    expect(page).to have_content "Claude Monet"
    expect(page).to have_content "1874"
  end

  scenario "adds a painting for a gallery unsuccessfully" do
    mfa = Gallery.create(name: "MFA", city: "Boston", state: "MA", zip: "02155")

    visit gallery_path(mfa)

    click_link "Add a Painting"
    expect(page).to have_content "Painting Form for MFA"

    fill_in "Title", with: "Dopest Painting"

    click_button "Add Painting"

    expect(page).to have_content mfa.name
    expect(page).to have_content "New Painting Form for MFA"
    expect(page).to have_content "Artist can't be blank"
    expect(page).to have_content "Year can't be blank"
  end
end
