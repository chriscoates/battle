require 'spec_helper'

feature 'Death' do
  scenario "When a player reaches 0HP shows death screen" do
    sign_in_and_play
    attack_to_death
    expect(page).to have_content("Game Over!")
  end
end