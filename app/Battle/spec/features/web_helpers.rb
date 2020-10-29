def sign_in_and_play
  visit('/')
  fill_in :player_1_name,  with: 'Dave'
  fill_in :player_2_name, with: 'Bob'
  click_button 'Submit'
end

def generate_loser
  15.times do
    click_button('Attack')
  end
end
