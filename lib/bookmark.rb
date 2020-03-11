require_relative 'database_connection'

class Bookmark
  attr_reader :id, :title, :url
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    # result = DatabaseConnection.query("SELECT * FROM bookmarks")
    DatabaseConnection.query("SELECT * FROM bookmarks").map do |bookmark|
      Bookmark.new(
        url: bookmark['url'],
        title: bookmark['title'],
        id: bookmark['id']
      )
    end
  end
  def self.create(url:, title:)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, url:, title:)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id}")
  end







end
