feature 'creating bookmarks' do
  scenario 'user can create bookmarks' do

    visit('/bookmarks/create')
    fill_in :bookmark, with: 'http://www.reddit.com/'
    click_button 'Create Bookmark'
    expect(page).to have_content 'http://www.reddit.com/'
  end
end