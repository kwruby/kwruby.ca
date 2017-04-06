require 'spec_helper'

describe 'index', type: :feature do
  before do
    visit '/'
  end

  context 'page content' do
    it 'has the correct title header' do
      within 'h1' do
        expect(page).to have_content(/KWRuby/i)
      end
    end

    it 'has the introduction note' do
      within '.p-note' do
        expect(page).to have_content(
          /is a once a month Ruby workshop, training session, or discussion in Kitchener-Waterloo/i # rubocop:disable LineLength
        )
      end
    end

    it 'has a follow/join button' do
      expect(page).to have_link(
        'Join us!', href: 'http://www.meetup.com/kw-ruby-on-rails/'
      )
    end

    it 'has a link to the wiki' do
      expect(page).to have_link('wiki-link', href: '/wiki')
    end
  end

  context 'navigation' do
    it 'has navigation' do
      within('header') do
        expect(page).to have_selector('nav')
      end
    end

    it { expect(page.find('a.logo img')[:src]).not_to be_nil }
    it { expect(page.find('a.logo img')[:src]).to eq('/logo/current.png') }

    def expect_nav_link(location, href)
      within('nav') { expect(page).to have_link(location, href: href) }
    end

    # rubocop:disable LineLength
    it { expect_nav_link('Home',                       '/') }
    it { expect_nav_link('Wiki',                       '/wiki') }
    it { expect_nav_link('GitHub',                     'http://github.com/kwruby') }
    it { expect_nav_link('Twitter',                    'https://twitter.com/kwrubydev') }
    it { expect_nav_link('LinkedIn',                   'https://www.linkedin.com/groups?home=&gid=8311601') }
    it { expect_nav_link('Local Rubyists',             '/wiki/rubyists_in_waterloo') }
    it { expect_nav_link('Local Companies using Ruby', '/wiki/companies_using_ruby_in_waterloo') }
    # rubocop:enable
  end
end
