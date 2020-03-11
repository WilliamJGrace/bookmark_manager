feature 'Add Bookmarks' do
  scenario 'User can add bookmarks' do
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data

    visit ('/bookmarks/new')
      fill_in('url', with: 'https://www.bing.com')
      fill_in('title', with: 'bing')
      click_button 'Submit'

      expect(page).to have_link('bing', href: "https://www.bing.com")
  end
end
