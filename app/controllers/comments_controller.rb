class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment is awaiting moderation"
      redirect_to @commentable, notice: "Comment is awaiting moderation"
    else
      instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
      render template: "#{@resource}/show"
    end
  end

def update
     @comment = Comment.find(params[:id])
     if @comment.update_attributes(params[:comment])
       flash[:notice] = "Comment Approved!"
       redirect_to @comment.commentable
     else
       flash[:alert] = "Comment not approved."
       redirect_to post_path(@comment.commentable)
     end
   end

def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      flash[:notice] = "Comment Destroyed!"
      redirect_to post_path(@comment.commentable)
end

private

 def load_commentable
   resource, id = request.path.split('/')[1,2]
   @commentable = resource.singularize.classify.constantize.find(id)
 end


 def comment_params
   params.require(:comment).permit(:author,
                                   :author_url,
                                   :author_email,
                                   :content,
                                   :referrer,
                                   :approved,
                                   :commentable)
  end
end
