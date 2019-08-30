class CommentsController < ApplicationController
	before_action :set_course
	
	def create
		comment = @course.comments.create! comments_params
		CommentsMailer.submitted(comment).deliver_later
		CommentsChannel.broadcast(comment)
		
		redirect_to @course
	end

	private
		def set_course
			@course = Course.find(params[:course_id])
		end

		def comments_params
			params.required(:comment).permit(:body)
		end
end
