require 'rails_helper'

describe 'User delete clients' do
  scenario 'successfully' do
    user = User.create(email: 'bruno@email.com', password: 'bruno123')
    Client.create(name: 'Bruno Silva', email: 'bruno@email.com',
                  phone: '11 99999-9999')
    Client.create(name: 'João Carlos', email: 'joao@email.com',
                  phone: '11 00000-0000')
                   
    login_as(user, scope: :user)                      
    visit root_path
    click_on 'Clientes'
    click_on 'Bruno Silva'
    click_on 'Excluir Cliente'

    expect(page).to have_content 'O cliente foi excluido.'
    expect(page).not_to have_content 'Bruno Silva'
  end
end