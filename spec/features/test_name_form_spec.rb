feature 'Name form' do
  scenario 'submitting names' do
    visit('/')
    fill_in :name1, with: 'Titus'
    fill_in :name2, with: 'Chang'
    click_button 'Submit'

    save_and_open_page

    expect(page).to have_content('Titus vs. Chang')
  end
end
