class ContactsController < ApplicationController
  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @client = Client.find(params[:client_id])
    @contact = Contact.new
  end

  def create
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.new(contact_params)
    if @contact.save
      flash[:notice] = 'Contato registrado com sucesso!'
      redirect_to @contact
    else
      flash[:alert] = 'Contato não registrado. Corrija os erros!'
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :secondary_email, :phone,
                                    :comercial_phone)
  end
end