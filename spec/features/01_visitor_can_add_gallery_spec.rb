require "rails_helper"


feature "visitors can add galleries" do
  scenario "visitor adds new gallery successfully" do

    visit new_gallery_path
    expect(page).to have_content "New Gallery Form"

    fill_in 'Name', with: "The Whitney"
    fill_in 'City', with: "New York"
    fill_in 'State', with: "NY"
    fill_in 'Zip', with: "10128"
    fill_in 'Description', with: "A must see if you're in New York City"

    click_button "Add Gallery"

    expect(page).to have_content "Gallery added successfully"
    expect(page).to have_content "The Whitney"
    expect(page).to have_content "A must see if you're in New York City"
  end

  scenario "visitor does not provide proper information for an gallery" do
    visit new_gallery_path

    click_button "Add Gallery"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
  end
end
