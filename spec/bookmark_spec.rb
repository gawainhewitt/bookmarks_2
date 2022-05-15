require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '#.all' do
    it 'returns a list of bookmarks' do

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy Software')
      Bookmark.create(url: 'http://www.google.com/', title: 'Google')
      
      bookmarks = Bookmark.all

      # expect(bookmarks).to include("http://www.makersacademy.com/")
      # expect(bookmarks).to include("http://www.destroyallsoftware.com")
      # expect(bookmarks).to include("http://www.google.com/")
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
    end
  end

  describe '#.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: "http://www.reddit.com/", title: 'Reddit')
      persisted_data = persisted_data(table: 'bookmarks', id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Reddit'
      expect(bookmark.url).to eq 'http://www.reddit.com/'
    end
    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real bookmark', title: 'not a real bookmark')
      expect(Bookmark.all).to be_empty
    end
  end

  describe '#.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
  
      Bookmark.delete(id: bookmark.id)
  
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the bookmark with the given data' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Snakers Academy'
      expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#comments' do
    it 'returns a list of comments on the bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      DatabaseConnection.query(
        "INSERT INTO comments (id, text, bookmark_id) VALUES(1, 'Test comment', $1)",
        [bookmark.id]
      )
  
      comment = bookmark.comments.first
  
      expect(comment.text).to eq 'Test comment'
    end

    let(:comment_class) { double(:comment_class) }

    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
  
      bookmark.comments(comment_class)
    end
  end
end

# Test drive an update to the .all method of your Bookmark model, to do the following:
#   Use PG to connect to the PostgreSQL bookmark_manager database.
#   Retrieve all bookmark records from the bookmarks table.
#   Extract the URLs from the database response.