feature 'Viewing Hit points' do
  scenario 'view player 2 hit points' do
    sign_in_and_play
    expect(page).to have_content "Bob: 80HP"
  end
end
