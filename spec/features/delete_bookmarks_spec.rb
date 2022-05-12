feature 'deleting bookmarks' do
  scenario 'user can delete bookmarks' do

    visit('/bookmarks/create')
    fill_in :bookmark, with: 'http://www.reddit.com/'
    fill_in :title, with: 'Reddit'
    click_button 'Create Bookmark'
    visit('/bookmarks/create')
    fill_in :bookmark, with: 'http://www.google.com/'
    fill_in :title, with: 'Google'
    click_button 'Create Bookmark'
    visit('/bookmarks/delete')
    fill_in :title, with: 'Google'
    click_button 'Delete Bookmark'
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com/')
    expect(page).not_to have_link('Google', href: 'http://www.google.com/')

  end
end