require 'spec_helper'

# UnitTests for the Statics pages
describe "Static pages" do

  subject { page }

  # The common UnitTest for all static pages
  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  # UnitTests for the Home page
  describe "Home page" do
    before { visit root_path }

    let(:heading)     { 'MyMemoir' }
    let(:page_title)  { '' }

    it_should_behave_like "all static pages"
    it  { should_not have_title('| Home') }
  end

  # UnitTest for the Help page
  describe "Help page" do
    before { visit help_path }

    let(:heading)     { 'Help' }
    let(:page_title)  { 'Help' }

    it_should_behave_like "all static pages"
  end

  # UnitTest for the About page 
  describe "About page" do
    before { visit about_path }

    let(:heading)     { 'About' }
    let(:page_title)  { 'About' }

    it_should_behave_like "all static pages"
  end

  # UnitTest for the Contact page
  describe "Contact page" do
    before { visit contact_path }

    let(:heading)     { 'Contact' }
    let(:page_title)  { 'Contact' }

    it_should_behave_like "all static pages"
  end
  
  # UnitTest for checking the links have correct routes
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About Us'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Sign up now!"
    expect(page).to have_title(full_title('Sign up'))
  end

end


