class ArticlesController < ApplicationController
  respond_to :html, :xml
  before_filter :authenticate_user!, :except => [:show, :index]

  http_basic_authenticate_with name: "kvv", password: "secret", expect: [:index, :show]
  
  def index
    @articles = Article.all
    # binding.pry
    respond_with(@articles)
  end

  def show
    @article = Article.friendly.find(params[:id])
    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
    @article = Article.friendly.find(params[:id])
    respond_with(@article)
  end

  def create
    @article = Article.new(article_params)
    # ::PathChangingService.generate_reference(@article)

    if @article.save
      flash[:notice] = "Вдало збережена стаття"
    end

    respond_with(@article)
  end

  def update
    @article = Article.friendly.find(params[:id])

    if @article.update(article_params)
      flash[:notice] = "Вдало оновлена стаття"
    end
    respond_with(@article, :location => articles_url)
  end

  def destroy
    @article = Article.friendly.find(params[:id])
    @article.destroy
    flash[:notice] = "Вдало видаленна стаття"
    respond_with(@article)
  end

private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
