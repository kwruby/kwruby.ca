require "spec_helper"

describe "/wiki", :type => :feature do
  before do
    visit "/wiki"
  end

  context 'navigation' do
    it "has navigation" do
      page.should have_selector "nav"
    end
  end

  context 'page content' do
    it "has the correct title header" do
      page.should have_selector "h1"
      within "h1#title" do
        page.should have_content(/^Getting Started/i)
      end
    end

    it "has title for pages secion" do
      within "h1#pages-title" do
        page.should have_content(/^Pages/i)
      end
    end
  end
end
