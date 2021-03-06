require 'bookmark'
require 'database_helpers'
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


      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
            Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
            Bookmark.create(url: "http://www.google.com", title: "Google")


      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      p bookmark.id
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

    end

    describe ".create" do
      it "creates a bookmark" do
        bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
        persisted_data = persisted_data(id: bookmark.id, table: "bookmarks")
        expect(bookmark).to be_a Bookmark
        expect(bookmark.id).to eq persisted_data.first['id']
        expect(bookmark.title).to eq 'Test Bookmark'
        expect(bookmark.url).to eq 'http://www.testbookmark.com'
      end
      it "does not create a new bookmark if url is not valid" do
        Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
        expect(Bookmark.all).to be_empty
      end
    end

    describe '.delete' do
      it 'deletes a bookmark' do
        bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

        Bookmark.delete(id: bookmark.id)

        expect(Bookmark.all.length).to eq 0
      end
    end
    describe ".find" do
      it "can find bookmark" do
        bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

        result = Bookmark.find(id: bookmark.id)

        expect(result).to be_a Bookmark
        expect(result.id).to eq bookmark.id
        expect(result.title).to eq 'Makers Academy'
        expect(result.url).to eq 'http://www.makersacademy.com'
      end
    end
    describe "#comments" do
        it "comments on a bookmark" do
        bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
        DatabaseConnection.query("INSERT INTO comments (text, bookmark_id) VALUES('Test comment', #{bookmark.id})")
        comment = bookmark.comments[0]
        p comment
        p "THIDSIRGHERGNOREIGNORIJGN"
        expect(comment["text"]).to eq 'Test comment'
      end
    end
  end




end
