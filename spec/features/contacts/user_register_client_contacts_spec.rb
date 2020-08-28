require 'rails_helper'

describe 'User register client contacts' do
  scenario 'successfully' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                  phone: '11 99999-9999')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'Adicionar Contato'
    fill_in 'Nome', with: 'João Carlos'
    fill_in 'E-mail', with: 'joao@email.com'
    fill_in 'E-mail Secundário', with: 'joaocarlos@email.com'
    fill_in 'Telefone', with: '11 98765-4321'
    fill_in 'Telefone Comercial', with: '11 8888-8888'
    click_on 'Salvar'
    
    expect(page).to have_content 'Contato registrado com sucesso!'
    expect(page).to have_content 'Contato vinculado ao cliente: Bruno Silva'
    expect(page).to have_content 'Nome: João Carlos'
    expect(page).to have_content 'E-mail: joao@email.com'
    expect(page).to have_content 'E-mail Secundário: joaocarlos@email.com'
    expect(page).to have_content 'Telefone: 11 98765-4321'
    expect(page).to have_content 'Telefone Comercial: 11 8888-8888'
  end

  scenario 'and must fill the obligatory fields' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                  phone: '11 99999-9999')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'Adicionar Contato'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'E-mail Secundário', with: 'joaocarlos@email.com'
    fill_in 'Telefone', with: ''
    fill_in 'Telefone Comercial', with: '11 8888-8888'
    click_on 'Salvar'
    
    expect(page).to have_content 'Contato não registrado. Corrija os erros!'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Telefone não pode ficar em branco'
  end
end