require 'rails_helper'

describe 'Visitor visit home index' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content 'Bem vindo!'
  end

  scenario 'and login if already registered' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')

    visit root_path
    click_on 'Entrar'
    fill_in 'E-mail', with: 'bruno@email.com'
    fill_in 'Senha', with: 'bruno123'
    click_on 'Login'

    expect(page).to have_content 'Login efetuado com sucesso.'
  end

  scenario 'and logout' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Sair'

    expect(page).to have_content 'Logout efetuado com sucesso.'
  end
end