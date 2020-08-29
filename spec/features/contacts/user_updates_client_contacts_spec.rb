require 'rails_helper'

describe 'User updates client contacts' do
  scenario 'successfully' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                  phone: '11 99999-9999')
    Contact.create(client: client, name: 'João Carlos', email: 'joao@email.com',
                   phone: '11 98765-4321')
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'João Carlos'
    click_on 'Editar Contato'
    fill_in 'Nome', with: 'João Ribeiro'
    fill_in 'E-mail', with: 'joaocarlos@email.com'
    fill_in 'E-mail Secundário', with: 'joaoribeiro@email.com'
    fill_in 'Telefone', with: '11 12345-6789'
    fill_in 'Telefone Comercial', with: '11 8888-8888'
    click_on 'Salvar'
    
    expect(page).to have_content 'Contato atualizado com sucesso!'
    expect(page).to have_content 'Contato vinculado ao cliente: Bruno Silva'
    expect(page).to have_content 'Nome: João Ribeiro'
    expect(page).to have_content 'E-mail: joaocarlos@email.com'
    expect(page).to have_content 'E-mail Secundário: joaoribeiro@email.com'
    expect(page).to have_content 'Telefone: 11 12345-6789'
    expect(page).to have_content 'Telefone Comercial: 11 8888-8888'
  end

  scenario 'and must fill all the obligatory fields' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                  phone: '11 99999-9999')
    Contact.create(client: client, name: 'João Carlos', email: 'joao@email.com',
                   phone: '11 98765-4321')
    
    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'João Carlos'
    click_on 'Editar Contato'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'E-mail Secundário', with: 'joaoribeiro@email.com'
    fill_in 'Telefone', with: ''
    fill_in 'Telefone Comercial', with: '11 8888-8888'
    click_on 'Salvar'
    
    expect(page).to have_content 'Contato não atualizado. Corrija os erros!'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Telefone não pode ficar em branco'
  end
end