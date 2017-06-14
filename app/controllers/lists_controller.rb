class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = current_user.lists
  end

  def show
  end


  def new
    @list = current_user.lists.new
  end

  def edit
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new 
      
    end
  end

  def update
      if @list.update(list_params)
        redirect_to @list, notice: 'List was successfully updated.'
      else
        render :edit
      end
  end

  def destroy

    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = current_user.lists.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :user_id)
    end
end
