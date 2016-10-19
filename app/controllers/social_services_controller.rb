class SocialServicesController < ApplicationController
  before_action :set_social_service, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_admin, only: [:new, :create, :update, :destroy]

  def index
    @social_services = SocialService.all
  end

  def show
    @social_service_posts = @social_service.social_posts
    @content = @social_service
  end

  def new
    @social_service = SocialService.new
    @social_service.social_posts.build
  end

  def edit
  end

  def create
    @social_service = SocialService.new(social_service_params)
    if @social_service.save
      redirect_to @social_service
    else
      render :new
    end
  end

  def update
    if @social_service.update(social_service_params)
      redirect_to @social_service
    else
      render :edit
    end
  end

  def destroy
    redirect_to @social_service if @social_service.destroy
  end

  private
    def set_social_service
      @social_service = SocialService.find(params[:id])
    end

    def sign_in_admin
      redirect_to root_url, notice: "Страница не найдена" unless sign_in_admin? || sign_in_editor?
    end

    def social_service_params
      params.require(:social_service).permit(:name, social_posts_attributes: [:title, :text, :social_service_id])
    end
end
