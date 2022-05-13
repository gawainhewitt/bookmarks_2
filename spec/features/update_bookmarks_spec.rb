feature 'updating bookmarks' do
  scenario 'user can update bookmarks' do
    bookmark = Bookmark.create(url: 'http://www.reddit.com/', title: 'Reddit')
    visit('/bookmarks')
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com/')
    
    first('.bookmark').click_button 'Update'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in :url, with: 'http://www.google.com/'
    fill_in :title, with: 'Google'
    click_button 'Update'
    
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Google', href: 'http://www.google.com/')
    expect(page).not_to have_link('Reddit', href: 'http://www.reddit.com/')

  end
end