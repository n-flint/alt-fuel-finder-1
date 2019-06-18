require 'rails_helper'

RSpec.describe 'as a user on the root path' do
  context 'can search stations' do
    it 'by zip code' do
      # As a user
      #When I visit "/"
      visit root_path
      # And I fill in the search form with 80206 (Note: Use the existing search form)
      fill_in 'q', with: 802086
      # And I click "Locate"
      click_button 'Locate'
      # Then I should be on page "/search"
      expect(current_url).to eq('/search')
      # Then I should see the total results of the stations that match my query, 90.
      # There should be 93 stations that match NOT 90
      expect(page).to have_content('Total Stations: 93')
      # Then I should see a list of the 15 closest stations within 5 miles sorted by distance
      # And the stations should be limited to Electric and Propane
      # And the stations should only be public, and not private, planned or temporarily unavailable.
      within('.stations') do
        expect(page).to have_content('Closet 15 Stations:')
        expect(page).to have_css('.station', count: 15)
        # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
        within first('.station') do
          expect(page).to have_content('Name')
          expect(page).to have_content('Address:')
          expect(page).to have_content('Fuel Types:')
          expect(page).to have_content('Distance:')
          expect(page).to have_content('Access Times:')
        end
      end
    end
  end
end

