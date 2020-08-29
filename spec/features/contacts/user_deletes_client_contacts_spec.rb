require 'rails_helper'

describe 'User deletes client contacts' do
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
    click_on 'Excluir Contato'

    expect(page).to have_content 'O contato foi excluido!'
    expect(page).not_to have_content 'João Carlos'
  end
end