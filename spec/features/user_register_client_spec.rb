require 'rails_helper'

describe 'User register client' do
  scenario 'successfully' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Cliente'
    fill_in 'Nome', with: 'Bruno Silva'
    fill_in 'E-mail', with: 'bruno@email.com'
    fill_in 'E-mail Secundário', with: 'brunosilva@email.com'
    fill_in 'Telefone', with: '11 99999-9999'
    fill_in 'Telefone Comercial', with: '11 8765-4321'
    click_on 'Salvar'

    expect(page).to have_content 'Cliente cadastrado com sucesso!'
    expect(page).to have_content 'Nome: Bruno Silva'
    expect(page).to have_content 'E-mail: bruno@email.com'
    expect(page).to have_content 'E-mail Secundário: brunosilva@email.com'
    expect(page).to have_content 'Telefone: 11 99999-9999'
    expect(page).to have_content 'Telefone Comercial: 11 8765-4321'
  end

  scenario 'and must fill all obligatory fields' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Cliente'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'E-mail Secundário', with: 'brunosilva@email.com'
    fill_in 'Telefone', with: ''
    fill_in 'Telefone Comercial', with: '11 8765-4321'
    click_on 'Salvar'

    expect(page).to have_content 'Cliente não foi cadastrado. Corrija os erros!'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Telefone não pode ficar em branco'
  end
end