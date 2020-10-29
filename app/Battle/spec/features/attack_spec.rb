feature 'attack' do
  scenario 'player 1 attacking player 2' do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Dave attack successful!'
  end

  scenario 'player 2 attacking player 1' do
    sign_in_and_play
    click_button('Attack')
    click_button('Attack')
    expect(page).to have_content 'Bob attack successful!'
  end

  scenario "player 1's attack reduces player 2's health by 10" do
    sign_in_and_play
    click_button('Attack')
    expect(page).to have_content 'Bob: 70HP'
  end

  scenario 'player 2 gets to attack after player 1s turn' do
    sign_in_and_play
    click_button('Attack')
    click_button('Attack')
    expect(page).to have_content 'Dave: 70HP'
  end
end
