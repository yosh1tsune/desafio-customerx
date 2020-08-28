require 'rails_helper'

describe 'User updates clients' do
  scenario 'successfully' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    Client.create(name: 'Bruno Silva', email: 'bruno@email.com',
                  phone: '11 99999-9999')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'Editar Cliente'
    fill_in 'Nome', with: 'Bruno Felipe'
    fill_in 'E-mail', with: 'brunosilva@email.com'
    fill_in 'E-mail Secundário', with: 'brunofelipe@email.com'
    fill_in 'Telefone', with: '11 98765-4321'
    fill_in 'Telefone Comercial', with: '11 8888-8888'
    click_on 'Salvar'

    expect(page).to have_content 'Cliente atualizado com sucesso!'
    expect(page).to have_content 'Nome: Bruno Felipe'
    expect(page).to have_content 'E-mail: brunosilva@email.com'
    expect(page).to have_content 'E-mail Secundário: brunofelipe@email.com'
    expect(page).to have_content 'Telefone: 11 98765-4321'
    expect(page).to have_content 'Telefone Comercial: 11 8888-8888'
  end

  scenario 'and must fill all obligatory fields' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    Client.create(name: 'Bruno Silva', email: 'bruno@email.com',
                  phone: '11 99999-9999')

    login_as(user, scope: :user)
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'Editar Cliente'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'E-mail Secundário', with: 'brunofelipe@email.com'
    fill_in 'Telefone', with: ''
    fill_in 'Telefone Comercial', with: '11 8888-8888'
    click_on 'Salvar'

    expect(page).to have_content 'Cliente não foi atualizado. Corrija os erros!'
    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
    expect(page).to have_content 'Telefone não pode ficar em branco'
  end
end