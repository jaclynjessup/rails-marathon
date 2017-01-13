require 'rails_helper'


feature "visitor sees list of paintings in the gallery on the gallery show page" do
  scenario "sees reviews for specific gallery" do
    mfa = Gallery.create(name: "MFA", city: "Boston", state: "MA", zip: "02155")
    french_farmhouse = Painting.create(title: "French Farmhouse", year: "1893", artist: "Philip Leslie Hale", gallery: mfa)

    visit gallery_path(mfa)

    expect(page).to have_content mfa.name
    expect(page).to have_content french_farmhouse.title
    expect(page).to have_content french_farmhouse.year
    expect(page).to have_content french_farmhouse.artist
    expect(page).to have_content french_farmhouse.created_at.strftime("%B %d %Y")
  end

  scenario "does not see other paintings for other galleries" do
    guggenheim = Gallery.create(name: "The Guggenheim", city: "New York", state: "NY", zip: "10128")
    vanish = Painting.create(title: "Vanish", year: "1959", artist: "Pierre Alechnisky", gallery: guggenheim)

    mfa = Gallery.create(name: "MFA", city: "Boston", state: "MA", zip: "02155")
    french_formhouse = Painting.create(title: "French Farmhouse", year: "1893", artist: "Philip Leslie Hale", gallery: mfa)
    visit gallery_path(mfa)


    visit gallery_path(guggenheim)

    expect(page).to have_content guggenheim.name
    expect(page).to have_content vanish.artist

    expect(page).not_to have_content mfa.name
    expect(page).not_to have_content french_formhouse.title
  end
end
