require 'capybara/rspec'
require_relative '../../app'
Capybara.app = Battle

feature "can see player 2 HP" do
  before do
    sign_in_and_play
  end

  scenario "as player 1" do
    expect(page).to have_content "Chris HP: 100"
  end
end

feature "can see player 1 HP" do
  before do
    sign_in_and_play
  end

  scenario "as player 2" do
    expect(page).to have_content "Kim HP: 100"
  end
end

feature "can attack player 2" do

  scenario "see player 2 HP decrease by 10" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).not_to have_content 'Chris HP: 100'
    expect(page).to have_content "Chris HP: 90"
  end

  scenario "as player 1 and get a confirmation" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).to have_content "Attack on Chris successful!"
  end
end


feature 'can switch turns' do

  scenario "after player 1 attacks player 2" do
    sign_in_and_play
    click_button("Attack!")
    expect(page).not_to have_content "It is Kim's turn. It is turn 2"
    expect(page).to have_content "It is Chris's turn. It is turn 2"
  end
end

feature "can attack player 1" do

    scenario "after player 2 has been attacked" do
      sign_in_and_play
      click_button("Attack!")
      click_button("Attack!")
      expect(page).not_to have_content 'Kim HP: 100'
      expect(page).to have_content "Kim HP: 90"
    end
  
end
