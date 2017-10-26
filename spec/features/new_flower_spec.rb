require "rails_helper"

RSpec.feature "Create a flower", :type => :feature do
  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => "Blue"
    check 'Edible'
    click_button "Save"

    expect(page).to have_text("Flower was successfully created.")
  end

  scenario "User creates a new flower with edible uncheck" do
    visit "/flowers/new"

    fill_in "Name", :with => "Sunflower"
    fill_in "Color", :with => "Blue"
    uncheck 'Edible'
    click_button "Save"

    expect(page).to have_text("Flower was successfully created.")
  end

  scenario "User creates a new flower without color" do
    visit "/flowers/new"

    fill_in "Name", :with => "Daisy"
    click_button "Save"

    expect(page).to have_text("Color can't be blank")
  end

  scenario "User creates a new flower with no name" do
    visit "/flowers/new"

    fill_in "Color", :with => "Blue"
    click_button "Save"

    expect(page).to have_text("Name can't be blank")
  end

end
