require 'rails_helper' # erstmal hier deaktiviert

describe "New author page", :type => :feature do #type: ?

    it "should exist at 'new_author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit new_author_path
    end
    it "should have text inputs for an author's first name, last name and homepage" do
        visit new_author_path
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end
end