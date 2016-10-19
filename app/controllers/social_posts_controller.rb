class SocialPostsController < ApplicationController
  before_action :set_social_post, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_admin, only: [:new, :create, :update, :destroy]

  def index
    @social_posts = SocialPost.where(social_service_id: params[:id].to_i)
  end

  def show
  end

  def new
    @social_post = SocialPost.new
  end

  def edit
  end

  def create
    @social_post = SocialPost.new(social_post_params)
    if @social_post.save
      redirect_to @social_post
    else
      render :new
    end
  end

  def update
    if @social_post.update(social_post_params)
      redirect_to @social_post
    else
      render :edit
    end
  end

  def destroy
    redirect_to social_posts_path(id: params[:social_service_id]) if @social_post.destroy
  end

  private
    def set_social_post
      @social_post = SocialPost.find(params[:id])
    end

    def sign_in_admin
      redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
    end

    def social_post_params
      params.require(:social_post).permit(:title, :text, :social_service_id)
    end
end
