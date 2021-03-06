feature 'viewing bookmarks' do
  scenario 'user can view bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com/', title: 'Makers')
    Bookmark.create(url: 'http://www.destroyallsoftware.com',title: 'Destroy Software')
    Bookmark.create(url: 'http://www.google.com/', title: 'Google')

    visit('/bookmarks') 

    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com/' )
    expect(page).to have_link('Destroy Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com/')
  end
end
