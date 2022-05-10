require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com/');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com/")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com/")
    end

  end
end

# Test drive an update to the .all method of your Bookmark model, to do the following:
#   Use PG to connect to the PostgreSQL bookmark_manager database.
#   Retrieve all bookmark records from the bookmarks table.
#   Extract the URLs from the database response.