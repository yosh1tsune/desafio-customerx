class ContactsController < ApplicationController
  before_action :authenticate_user!

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

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = 'Contato atualizado com sucesso!'
      redirect_to @contact
    else
      flash[:alert] = 'Contato não atualizado. Corrija os erros!'
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @client = @contact.client
    @contact.destroy
    flash[:notice] = 'O contato foi excluido!'
    redirect_to @client
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :secondary_email, :phone,
                                    :comercial_phone)
  end
end