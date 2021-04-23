class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :update, :destroy]

  # GET /blog_posts
  def index
    @blog_posts = BlogPost.all

    render json: @blog_posts
  end

  # GET /blog_posts/1
  def show
    render json: @blog_post
  end

  # POST /blog_posts
  def create
    @blog_post = BlogPost.new(blog_post_params)
    pp @blog_post, blog_post_params
    if @blog_post.save
      render json: @blog_post, status: :created, location: @blog_post
    else
      render json: @blog_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blog_posts/1
  def update
    if @blog_post.update(blog_post_params)
      render json: @blog_post
    else
      render json: @blog_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blog_posts/1
  def destroy
    @blog_post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_post_params
      params.require(:blog_post).permit(:title, :content, :state)
    end
end
