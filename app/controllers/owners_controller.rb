class OwnersController < ApplicationController

  # Callbacks
  before_action :set_owner, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  authorize_resource

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.active.alphabetical.paginate(:page => params[:page]).per_page(10)
    
  end

  # GET /owners/1
  # GET /owners/1.json
  def show
  
  end

  # GET /owners/new
  def new
    @owner = Owner.new
  end

  # GET /owners/1/edit
  def edit
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(owner_params)
    respond_to do |format|
      if @owner.save
        format.html { redirect_to @owner, notice: 'Owner was successfully created.' }
        format.json { render :show, status: :created, location: @owner }
      else
        format.html { render :new }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owners/1
  # PATCH/PUT /owners/1.json
  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner }
      else
        format.html { render :edit }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to owners_url, notice: 'Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Methods that are not accessed outside of this class
    # Use callbacks to share common setup or constraints between actions.
    def set_owner
      @owner = Owner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #  this is the strong parameters method
    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :street, :city, :state, :zip, :phone, :email, :active)
    end
end
