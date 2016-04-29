require 'spec_helper'

feature 'Attack other player' do
  scenario "Player 1 can attack Player 2" do
    sign_in_and_play
    attack
    expect(page).to have_content("Amy attacked Chris!")
  end
end

feature 'Attack reduces Hit Points' do
  scenario "Player 1's attack reduces Player 2's HP" do
    allow(Kernel).to receive(:rand) {10}
    sign_in_and_play
    attack
    expect(page).to have_content("Chris's HP reduced to 90!")
    expect(page).not_to have_content("Chris's HP reduced to 100!")
  end

end