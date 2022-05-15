feature 'creating bookmarks' do
  scenario 'user can create bookmarks' do

    visit('/bookmarks/create')
    fill_in :bookmark, with: 'http://www.reddit.com/'
    fill_in :title, with: 'Reddit'
    click_button 'Create Bookmark'
    expect(page).to have_link('Reddit', href: 'http://www.reddit.com/')
  end
  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/create')
    fill_in('bookmark', with: 'not a real bookmark')
    click_button('Create Bookmark')
  
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end