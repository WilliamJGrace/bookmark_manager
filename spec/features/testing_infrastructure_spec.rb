feature 'testing infrastructure' do
  scenario 'page loads' do
    visit ('/')
    expect(page).to have_content 'Hello world!'
  end
end
