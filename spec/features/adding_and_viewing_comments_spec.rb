feature 'View and add comments' do
  scenario 'User can add and view comments to their current bookmarks' do
    bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit ('/bookmarks')
    click_button 'Add Comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"
    fill_in 'comment', with: 'this is a test comment on this bookmark'
    click_button 'Submit'

    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content 'this is a test comment on this bookmark'




  end
end
