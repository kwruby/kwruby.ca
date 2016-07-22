require "spec_helper"

describe "index", :type => :feature do
  before do
    visit "/"
  end

  context "page content" do
    it "has the correct title header" do
      page.should have_selector "h1"
      within "h1" do
        page.should have_content(/Dedicated to learning and sharing about Ruby/i)
      end
    end

    it "has a welcoming message to new people" do
      within "#skill" do
        page.should have_content(/All skill levels are welcome/i)
      end
    end

    it "has a button asking people to join us" do
      page.should have_selector "form"
      expect(find_button('Join us!')).not_to be_nil
    end

    it "has a link to meetup" do
      page.should have_selector "a"
      expect(page.find('a.sign-up')).not_to be_nil
      expect(page.find('a.sign-up')[:href]).to eq("http://www.meetup.com/kw-ruby-on-rails/")
    end

    it "has a link to the wiki" do
      page.should have_selector "a"
      expect(page.find('a#wiki-link')).not_to be_nil
      expect(page.find('a#wiki-link')[:href]).to eq("/wiki")
    end
  end

  context "navigation" do
    it "has navigation" do
      page.should have_selector "nav"
      page.should have_selector "header"
    end
    it { expect(page.find('a.logo img')[:src]).not_to be_nil }
    it { expect(page.find('a.logo img')[:src]).to eq("/logo/current.png") }
    it { expect(page.find('#nav-home a')[:href]).to eq("/") }
    it { expect(page.find('#nav-wiki a')[:href]).to eq("/wiki") }
    it { expect(page.find('#nav-rubyists a')[:href]).to eq("/wiki/rubyists_in_waterloo") }
    it { expect(page.find('#nav-companies a')[:href]).to eq("/wiki/companies_using_ruby_in_waterloo") }
    it { expect(page.find('#nav-github a')[:href]).to match(/github/) }
    it { expect(page.find('#nav-github a')[:href]).to match(/kwruby/) }
    it { expect(page.find('#nav-twitter a')[:href]).to match(/twitter/) }
    it { expect(page.find('#nav-twitter a')[:href]).to match(/kwrubydev/) }
    it { expect(page.find('#nav-linkedin a')[:href]).to match(/linkedin/) }
    it { expect(page.find('#nav-linkedin a')[:href]).to match(/8311601/) }
  end
end
