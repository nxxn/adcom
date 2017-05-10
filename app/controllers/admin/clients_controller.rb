class Admin::ClientsController < AdminController

  def index
    @clients = Client.all.order("created_at DESC")
  end

  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @client = Client.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @client = Client.find(params[:id])

  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to(admin_clients_url, :notice => 'Client was successfully created.') }
      else
        @clients = Client.all
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(client_params)

        format.html { redirect_to(admin_clients_url, :notice => 'Client was successfully updated.') }
      else
        @clients = Client.all
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(admin_clients_url) }
    end
  end

  private

    def client_params
      params.require(:client).permit(:title, :description, :department, :work_image)
    end

end
