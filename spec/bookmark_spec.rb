require 'bookmark'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do
      Bookmark.create('http://www.makersacademy.com/')
      Bookmark.create('http://www.destroyallsoftware.com')
      Bookmark.create('http://www.google.com/')
      
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com/")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.google.com/")
    end
  end

  describe '#.create' do
    it 'creates a new bookmark' do
      Bookmark.create("http://www.reddit.com/")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.reddit.com/")
    end
  end
end

# Test drive an update to the .all method of your Bookmark model, to do the following:
#   Use PG to connect to the PostgreSQL bookmark_manager database.
#   Retrieve all bookmark records from the bookmarks table.
#   Extract the URLs from the database response.