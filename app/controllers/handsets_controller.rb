class HandsetsController < ApplicationController
	
	def new
		@handset = Handset.new
	end

	def create
	   @handset = Handset.new(params[:handset])
    if @handset.save
      # Handle a successful save.
      flash[:success] = "Hand set created successfully"
      redirect_to handsets_path
    else
      render 'new'
    end
	end

	def index
		@handsets = Handset.paginate(page: params[:page],:per_page => 20)
	end

	def edit
		@handset = Handset.find(params[:id])
	end

	def update
	@handset = Handset.find(params[:id])
    if @handset.update_attributes(params[:handset])
      # Handle a successful update.
      flash[:success] = "Changes saved successfully"
      redirect_to handsets_path
    else
      render 'edit'
    end

  end

  def destroy
  	if Handset.find(params[:id]).destroy
	    flash[:success] = "Hand set deleted."
	    redirect_to agents_path
  	else
	      flash[:notice] = "Handset Delete failed" 
	      redirect_to agents_path
  	end
  
  end

end
