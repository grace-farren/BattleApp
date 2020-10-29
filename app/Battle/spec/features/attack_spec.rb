feature 'attack' do
  scenario 'player 1 attacking player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Player 1s attack successful!'
  end

  scenario "player 1's attack reduces player 2's health by 10" do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Bob: 70HP'
  end
end
