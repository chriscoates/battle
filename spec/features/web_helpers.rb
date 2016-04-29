def sign_in_and_play
  visit('/')
  fill_in('name1', with:"Amy")
  fill_in('name2', with:"Chris")
  click_button('Submit')
end

def attack
  click_button('Attack!')
end

def switch
  click_button('Next')
end

def attack_to_death
  allow(Kernel).to receive(:rand) {10}
  18.times { attack_and_next }
  attack
end

def attack_and_next
  click_button('Attack!')
  click_button('Next')
end