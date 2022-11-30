class CommentsController < ApplicationController
    before_action :require_login

    def create
        @tour = Tour.find(params[:tour_id])
        @comment = @tour.comments.create(comment_params.merge(user_id: current_user.id))
        if @comment.save
            redirect_to tour_path(@tour)
        end
    end

    def destroy 
        @tour = Tour.find(params[:tour_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to @tour
    end

    private 
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
    
    def comment_params
        params.require(:comment).permit(:content, :user_id, :tour_id)
    end

end
