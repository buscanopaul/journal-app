require "rails_helper"

RSpec.describe "category" do
  it "create category" do
    visit "/categories/new"
    fill_in "Name", with: "financial"
    fill_in "Description", with: "money"
    sleep(5)
    click_button "Submit"
    expect(page).to have_content("financial")
    expect(page).to have_content("money")
    sleep(5)
    category = Category.order("id").last
    visit "/categories/#{category.id}/edit"
    fill_in "Name", with: "financial edited"
    sleep(5)
    click_button "Submit"
    visit "/categories"
    expect(page).to have_content("financial edited")
    sleep(5)
  end
end
