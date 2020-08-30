User.create(email: 'user@email.com', password: 'user123')

client = Client.create(name: 'Bruno Silva', phone: '11 99999-9999',
                       comercial_phone: '11 0123-4567',email: 'bruno@email.com',
                       secondary_email: 'brunosilva@email.com')

second_client = Client.create(name: 'João Carlos', phone: '11 55555-5555',
                              comercial_phone: '11 0099-9900',
                              email: 'joao@email.com',
                              secondary_email: 'joaocarlos@email.com')

Client.create(name: 'Claudio Hertz', phone: '99 98765-4321',
              comercial_phone: '55 98989-1212', email: 'claudio@email.com',
              secondary_email: 'claudiohertz@email.com')

Contact.create(client: client, name: 'Maria Clara', phone: '77 77777-7777',
               comercial_phone: '77 2323-3232', email: 'maria@email.com',
               secondary_email: 'mariaclara@email.com')

Contact.create(client: client, name: 'Julia Martins', phone: '44 44444-4444',
               comercial_phone: '44 4521-5698', email: 'julia@email.com',
               secondary_email: 'juliamartins@email.com')

Contact.create(client: client, name: 'José Pedro', phone: '18 87524-1111',
               comercial_phone: '21 5483-3265', email: 'jose@email.com',
               secondary_email: 'josepedro@email.com')

Contact.create(client: client, name: 'William Souza', phone: '25 65421-9756',
               comercial_phone: '25 3624-4718', email: 'william@email.com',
               secondary_email: 'williamsouza@email.com')

Contact.create(client: second_client, name: 'Mario Ruiz',
               phone: '98 14785-3625', comercial_phone: '98 3251-5678',
               email: 'mario@email.com',
               secondary_email: 'marioruiz@email.com')

Contact.create(client: second_client, name: 'Marcela Dias',
               phone: '36 65841-2651', comercial_phone: '36 8547-3625',
               email: 'marcela@email.com',
               secondary_email: 'marceladias@email.com')