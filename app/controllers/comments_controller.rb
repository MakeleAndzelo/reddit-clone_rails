class CommentsController < ApplicationController
	before_action :find_link
	before_action :find_comment, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

	def create
		@comment = @link.comments.create(comment_param)
		@comment.user_id = current_user.id

		if @comment.save
			flash[:success] = "Successfuly added a comment"
			redirect_to @link
		else
			flash[:alert] = 'Comment was empty!'
			redirect_to @link
		end
	end	

	def edit
	end

	def update
		if @comment.update(comment_param)
			flash[:success] = "Successfuly edited a comment"
			redirect_to @link
		else
			flash[:alert] = "Something was wrong"
			render "edit"
		end
	end

	def destroy
		@comment.destroy
		flash[:success] = "Successfuly deleted a comment"
		redirect_to @link
	end


	private
		def comment_param
			params.require(:comment).permit(:body)
		end

		def find_link
			@link = Link.find(params[:link_id])
		end

		def find_comment
			@comment = @link.comments.find(params[:id])
		end
end
