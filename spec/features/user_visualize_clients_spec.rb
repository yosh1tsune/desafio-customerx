require 'rails_helper'

describe 'User visualize clients' do
  scenario 'successfully as list' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com',
                           phone: '11 99999-9999')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content "Nome: #{client.name}"
    expect(page).to have_content "E-mail: #{client.email}"
    expect(page).to have_content "Telefone: #{client.phone}"
    expect(page).to have_content "Cadastrado em: #{client.created_at}"
  end

  scenario "and see the advise if there's no clients registered" do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content 'Não há clientes registrados!'
  end

  scenario 'and must be logged in to visualize the list' do
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end

  scenario 'and choose one of the list' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    Client.create(name: 'Bruno Silva', email: 'bruno@email.com',
                           phone: '11 99999-9999')
    Client.create(name: 'João Carlos', email: 'joao@email.com',
                          phone: '11 00000-0000')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'

    expect(page).to have_content 'Nome: Bruno Silva'
    expect(page).to have_content 'E-mail: bruno@email.com'
    expect(page).to have_content 'Telefone: 11 99999-9999'
  end

  scenario 'and must be logged in to visualize a single candidate' do
    client = Client.create(name: 'Bruno Silva', email: 'bruno@email.com',
                  phone: '11 99999-9999')

    visit client_path(client)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end
end