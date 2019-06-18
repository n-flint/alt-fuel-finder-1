require 'rails_helper'

RSpec.describe 'as a user on the root path' do
  context 'can search stations' do
    it 'by zip code' do
      visit root_path

      fill_in 'q', with: 80206

      click_button 'Locate'

      expect(current_path).to eq('/search')
      expect(page).to have_content('Total Stations: 92')

      within('.stations') do
        expect(page).to have_content('Closest 15 Stations:')
        expect(page).to have_css('.station', count: 15)
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
