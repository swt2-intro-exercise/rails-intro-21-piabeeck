require 'rails_helper' # erstmal hier deaktiviert

RSpec.describe Author, type: :model do
  
  it "(the author model) should have a first_name, last_name and homepage, which are all strings." do
    author = Author.new(
        first_name:"Alan",
        last_name:"Turing",
        homepage:"http://wikipedia.org/Alan_Turing")

    expect(author.first_name).to eq("Alan")
    expect(author.last_name).to eq("Turing")
    expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
  end

  it "should furthermore have a method name (no parameters) which returns the full name of an author." do
    author = Author.new(
        first_name:"Alan",
        last_name:"Turing",
        homepage:"http://wikipedia.org/Alan_Turing")
    expect(author.name).to eq(author.first_name + " " + author.last_name)
  end

end
