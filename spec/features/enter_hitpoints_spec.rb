require 'spec_helper'

feature 'Enter starting HP' do
  scenario "Player 1 can see Player 2's Hit Points" do
    sign_in_and_play
    expect(page).to have_content("Chris has 100 Hit Points")
  end

  scenario "Player 2 can see Player 1's Hit Points" do
    sign_in_and_play
    expect(page).to have_content("Amy has 100 Hit Points")
  end
end

feature "Attack updates HP's for P2" do
  scenario "Player 1 can see Player 2's Hit Points" do
    sign_in_and_play
    click_button('Attack!')
    click_button('Switch')
    click_button('Attack!')
    click_button('Switch')
    expect(page).to have_content("Amy has 90 Hit Points")
  end
end