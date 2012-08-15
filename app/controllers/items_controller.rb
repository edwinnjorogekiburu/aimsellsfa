class ItemsController < ApplicationController
  def index
  	@items = Item.paginate(page: params[:page],:per_page => 20)
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(params[:item])
    if @item.save
      # Handle a successful save.
      flash[:success] = "Item created successfully"
      redirect_to items_path
    else
      render 'new'
    end
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def update
  	@item = Item.find(params[:id])
	    if @item.update_attributes(params[:item])
	      # Handle a successful update.
	      flash[:success] = "Changes saved Successfully"
	      redirect_to items_path
	    else
	      render 'edit'
	    end
  end

  def destroy
	if Item.find(params[:id]).destroy
	    flash[:success] = "Item deleted."
	    redirect_to items_path
  	else
	      flash[:notice] = "Employee Delete failed" 
	      redirect_to items_path
  	end
  end


end
