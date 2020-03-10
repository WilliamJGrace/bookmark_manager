require 'bookmark'

describe Bookmark do
  # subject(:book) { described_class.new("text",["bookmark", "bookmark2"])}
  # it "returns text" do
  #   expect(book.text).to eq("text")
  # end
  #
  # it "returns a list of bookmakrs" do
  #   expect(book.all).to eq(["bookmark", "bookmark2"])
  # end

  describe '.all' do
    it 'returns all bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')



      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end

    describe ".create" do
      it "creates a bookmark" do
        Bookmark.create(url: "www.bing.com")
        expect(Bookmark.all).to include("www.bing.com")
      end
    end
  end




end
