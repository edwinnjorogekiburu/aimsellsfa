class ItemCategoriesController < ApplicationController

	def new
		@item_category = ItemCategory.new
	end

	def create
	@item_category = ItemCategory.new(params[:item_category])
    if @item_category.save
      # Handle a successful save.
      flash[:success] = "Item category created successfully"
      redirect_to item_categories_path
    else
      render 'new'
    end
	end

	def index
		@item_categories = ItemCategory.paginate(page: params[:page],:per_page => 10)
	end

	def edit
		@item_category = ItemCategory.find(params[:id])
	end

	def update
		@item_categories = ItemCategory.find(params[:id])
	    if @item_categories.update_attributes(params[:item_categories])
	      # Handle a successful update.
	      flash[:success] = "Changes saved Successfully"
	      redirect_to item_categories_path
	    else
	      render 'edit'
	    end
	end

	def destroy
	if ItemCategory.find(params[:id]).destroy
	    flash[:success] = "Item category deleted."
	    redirect_to item_categories_path
  	else
	      flash[:notice] = "Item category Delete failed" 
	      redirect_to item_categories_path
  	end


	end

end
