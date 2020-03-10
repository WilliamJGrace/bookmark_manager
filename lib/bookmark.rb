require 'pg'


class Bookmark
  attr_reader :text
  # def initialize(text, list)
  #   @text = text
  #   @list = list
  # end

  def self.all
    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }

  #   [
  #     "http://www.makersacademy.com",
  #     "http://www.destroyallsoftware.com",
  #     "http://www.google.com"
  #    ]
  end



end
