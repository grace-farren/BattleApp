feature 'outcome' do
  scenario 'player loses' do
    sign_in_and_play
    generate_loser

    expect(page).to have_content 'You lose! 0HP!'

  end
end
