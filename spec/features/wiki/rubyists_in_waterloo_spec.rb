require 'spec_helper'

describe '/wiki/rubyists_in_waterloo', type: :feature do
  before do
    visit '/wiki/rubyists_in_waterloo'
  end

  context 'navigation' do
    it 'has navigation' do
      expect(page).to have_selector('nav')
    end
  end

  context 'page content' do
    it 'has the correct title header' do
      within 'h1', match: :first do
        expect(page).to have_content(/^Rubyists in Waterloo/i)
      end
    end

    it 'has a list of elements' do
      expect(page).to have_selector('ul')
      expect(page).to have_selector('li')
    end
  end
end
