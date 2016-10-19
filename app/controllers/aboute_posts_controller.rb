class AboutePostsController < ApplicationController
  before_action :set_aboute_post, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_admin, only: [:create, :edit, :update, :destroy]

  def index
    @aboute_posts = AboutePost.where(aboute_id: params[:aboute_id].to_i)
  end

  def show
  end

  def new
    @aboute_post = AboutePost.new
  end

  def edit
  end

  def create
    @aboute_post = AboutePost.new(aboute_post_params)
    if @aboute_post.save
      redirect_to @aboute_post
    else
      render :new
    end
  end

  def update
    if @aboute_post.update(aboute_post_params)
      redirect_to @aboute_post
    else
      render :edit
    end
  end

  def destroy
    redirect_to aboute_posts_path(aboute_id: params[:aboute_id]) if @aboute_post.destroy
  end

  private
    def set_aboute_post
      @aboute_post = AboutePost.find(params[:id])
    end

    def aboute_post_params
      params.require(:aboute_post).permit(:title, :text, :aboute_id)
    end

    def sign_in_admin
      redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
  	end
end
