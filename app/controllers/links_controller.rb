class LinksController < ApplicationController
	before_action :find_link, only: [:show, :edit, :update, :destroy]

	def index
		@links = Link.all.order('created_at DESC')		
	end

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(link_params)

		if @link.save
			flash[:success] = "Successfuly added a new link"
			redirect_to @link
		else
			render "new"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @link.update(link_params)
			flash[:success] = "Successfuly edited a new link"
			redirect_to link_path(@link)
		else
			render "edit"
		end
	end
	
	def destroy
		@link.destroy
		flash[:success] = 'Successfuly deleted link'
		redirect_to root_path
	end

	private
		def link_params
			params.require(:link).permit(:title, :url, :description)
		end

		def find_link
			@link = Link.find(params[:id])
		end
end
