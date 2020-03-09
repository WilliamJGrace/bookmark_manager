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
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end




end
