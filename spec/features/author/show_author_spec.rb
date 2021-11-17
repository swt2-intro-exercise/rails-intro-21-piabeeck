require 'rails_helper'

describe "Author page", :type => :feature do #type: ?

    it "Author page should display all authors" do
        author = Author.new(
            first_name:"Alan",
            last_name:"Turing",
            homepage:"http://wikipedia.org/Alan_Turing")
        expect(page).to have_text("Alan")
        expect(page).to have_text("Turing")
        visit author_path(@Alan)
    end

    it "Author page should display author details #7" do
        # Tipp war: FactoryBot.create :author
        visit author_path(@Alan)
        expect(page).to have_text("Alan")
        expect(page).to have_text("Turing")
        expect(page).to have_text("http://wikipedia.org/Alan_Turing")
    end
    
end