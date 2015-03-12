class CommentsController < ApplicationController
  respond_to :html, :xml
  http_basic_authenticate_with name: "kvv", password: "secret", only: :destroy

  def create
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    respond_with(@article)
  end

  def destroy
    @article = Article.friendly.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    respond_with(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
