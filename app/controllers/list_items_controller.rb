class ListItemsController < ApplicationController
  before_action :set_list_item, only: %i[ show edit update destroy completed ]

  # GET /list_items or /list_items.json
  def index
    @list_items = ListItem.incomplete
  end

  # GET /list_items/1 or /list_items/1.json
  def show
  end

  # GET /list_items/new
  def new
    @list_item = ListItem.new
  end

  # GET /list_items/1/edit
  def edit
  end

  # POST /list_items or /list_items.json
  def create
    @list_item = ListItem.new(list_item_params)

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to root_path, notice: "List item was successfully created." }
      else
        format.html { render index, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_items/1 or /list_items/1.json
  def update
    respond_to do |format|
      if @list_item.update(list_item_params)
        format.html { redirect_to root_path, notice: "List item was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1 or /list_items/1.json
  def destroy
    @list_item.destroy
    respond_to do |format|
      format.html { redirect_to recently_completed_list_items_path, notice: "#{@list_item.description.capitalize} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def completed
    @list_item.mark_as_complete
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Well done! #{@list_item.description.capitalize} is complete!" }
      format.json { head :no_content }
    end
  end

  def recently_completed
    @list_items = ListItem.recently_completed
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list_item
      @list_item = ListItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_item_params
      params.require(:list_item).permit(:description, :complete)
    end
end
