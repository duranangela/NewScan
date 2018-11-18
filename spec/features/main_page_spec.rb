require 'rails_helper'

describe 'main page features' do
  it 'shows features on the main page' do
    visit '/'

    expect(page).to have_css(".topic")
    expect(page).to have_css(".date")
    expect(page).to have_css(".articles")

  end
end
