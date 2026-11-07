class ArticlesController < ApplicationController
  
    before_action :set_article, only: [:show, :edit, :update, :destroy] 
  
  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article Updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article created successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article deleted successfully"
      redirect_to articles_path
    else
      render 'index'
    end
  end

  private 

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
