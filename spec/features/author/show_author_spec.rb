require 'rails_helper'

describe "Author page", :type => :feature do #type: ?
    
    context "Authors index page with view 'authors/index.html.erb'" do
        it "shows only authors persisted in the db" do
            # amount of author objects in the db
            prev_count = Author.count
            alan = Author.new(
                first_name:"Alan",
                last_name:"Turing",
                homepage:"http://wikipedia.org/Alan_Turing")
            after_count = Author.count
            expect(prev_count).to be == after_count
            # Authors not saved aren't shown
            visit authors_path
            expect(page).to_not have_text(alan.first_name)
            expect(page).to_not have_text(alan.last_name)
        end

        it "shows authors saved to the db" do
            prev_count = Author.count
            alan = Author.new(first_name:"Alan",last_name:"Turing",homepage:"http://wikipedia.org/Alan_Turing")
            alan.save
            after_count = Author.count
            expect(after_count).to be (prev_count+1)
            # now author should be shown
            visit authors_path
            expect(page).to have_text(alan.first_name)
            expect(page).to have_text(alan.last_name)
        end

        it "links to the new author page #8" do
            visit authors_path
            expect(page).to have_link 'New', href: new_author_path
        end
    end

    context "Author show detail page with view 'authors/show.html.erb'" do
        before(:each) do
            @alan = FactoryBot.create(:author)
        end

        it "display a single author's details #7" do
           visit author_path(@alan)
           expect(page).to have_text(@alan.first_name)
           expect(page).to have_text(@alan.last_name)
           expect(page).to have_text(@alan.homepage)
        end
    end
end
