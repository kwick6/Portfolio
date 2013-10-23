class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to post_path(@comment.post_id)
    else
      @post = Post.find(@comment.post_id)
      render template: "posts/show"
    end
  end

def update
     @comment = Comment.find(params[:id])
     if @comment.update_attributes(params[:comment])
       flash[:notice] = "Comment Approved!"
       redirect_to @comment.post
     else
       flash[:alert] = "Comment not approved."
       redirect_to post_path(@comment.post_id)
     end
   end

def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:notice] = "Comment Destroyed!"
      redirect_to post_path(@comment.post_id)
end

private

  def comment_params
    params.require(:comment).permit(:author,
                                   :author_url,
                                   :author_email,
                                   :content,
                                   :referrer,
                                   :approved,
                                   :post_id)
  end
end
