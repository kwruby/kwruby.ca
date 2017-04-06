require 'spec_helper'

describe '/wiki', type: :feature do
  before do
    visit '/wiki'
  end

  context 'navigation' do
    it 'has navigation' do
      expect(page).to have_selector('nav')
    end
  end

  context 'page content' do
    it 'has the correct title header' do
      within 'h1', match: :first do
        expect(page).to have_content(/^Getting Started/i)
      end
    end

    it 'has title for pages secion' do
      within 'h1#pages' do
        expect(page).to have_content(/^Pages/i)
      end
    end
  end
end
