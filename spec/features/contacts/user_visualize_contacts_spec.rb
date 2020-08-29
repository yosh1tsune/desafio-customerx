require 'rails_helper'

describe 'User visualize contacts' do
  scenario "successfully by it's client show" do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                           phone: '11 99999-9999')
    Contact.create(client: client, name: 'João Carlos', phone: '11 98765-4321',
                   comercial_phone: '11 8888-8888', email: 'joao@email.com',
                   secondary_email: 'joaocarlos@email.com')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    
    expect(page).to have_content 'Nome: João Carlos'
    expect(page).to have_content 'E-mail: joao@email.com'
    expect(page).to have_content 'E-mail Secundário: joaocarlos@email.com'
    expect(page).to have_content 'Telefone: 11 98765-4321'
    expect(page).to have_content 'Telefone Comercial: 11 8888-8888'
  end

  scenario 'and choose one' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                           phone: '11 99999-9999')
    Contact.create(client: client, name: 'Bruno Felipe', phone: '11 98765-4321',
                   comercial_phone: '11 8888-8888', email: 'bruno@email.com',
                   secondary_email: 'joaocarlos@email.com')
    Contact.create(client: client, name: 'João Carlos', phone: '11 98765-4321',
                   comercial_phone: '11 8888-8888', email: 'joao@email.com',
                   secondary_email: 'joaocarlos@email.com')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'João Carlos'

    expect(page).to have_content 'Contato vinculado ao cliente: Bruno Silva'
    expect(page).to have_content 'Nome: João Carlos'
    expect(page).not_to have_content 'Nome: Bruno Felipe'
  end

  scenario 'and must be logged in' do
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com', 
                           phone: '11 99999-9999')
    contact = Contact.create(client: client, name: 'João Carlos', phone: '11 98765-4321',
                   comercial_phone: '11 8888-8888', email: 'joao@email.com',
                   secondary_email: 'joaocarlos@email.com')

    visit contact_path(contact)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
  
end