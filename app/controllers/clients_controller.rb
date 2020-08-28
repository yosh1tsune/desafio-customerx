class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:notice] = 'Cliente cadastrado com sucesso!'
      redirect_to @client
    else
      flash[:alert] = 'Cliente não foi cadastrado. Corrija os erros!'
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      flash[:notice] = 'Cliente atualizado com sucesso!'
      redirect_to @client
    else
      flash[:alert] = 'Cliente não foi atualizado. Corrija os erros!'
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = 'O cliente foi excluido.'
    render :index
  end

  private

  def client_params
    params.require(:client).permit(:name, :email, :secondary_email, :phone,
                                   :comercial_phone)
  end
end