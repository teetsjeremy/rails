class ArticlesController < ApplicationController
  before_action :configure_permitted_parameters,
                if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[ :id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[ :id])
  end

  def create
    @article = Article.new(article_params)


    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[ :id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[ :id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :user, :text, :comments, :image)
  end
end
