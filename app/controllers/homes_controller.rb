class HomesController < ApplicationController
  before_action :sign_in_admin, only: [:edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.last(3).reverse
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def robots
    render text: 'robots'
    # robots = File.read(Rails.root + 'config/robots.#{Rails.env}.txt')
    # render :text => robots, :layout => false, :content_type => 'text/plain'
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def sign_in_admin
    redirect_to root_url, notice: 'Страница не найдена' unless sign_in_admin?
  end
end
