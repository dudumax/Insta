class CommentsController < ApplicationController
  
  def create
    # It searches Blog from the values of parameter and build it as comments related to Blog.
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    # Change format according to client request
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to blog_path(@blog), notice: 'Post failed...' }
      end
    end
  end

  private
  # Strong Parameter
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
  
end
