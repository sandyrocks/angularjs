class Api::PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts.json
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1.json
  def show
    render json: @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts.json
  def create
    @post = Post.new(tweet_params)
      if @post.save
        render json: @post
      else
        render json: @post.errors
      end
  end

  # PATCH/PUT /posts/1.json
  def update
      if @post.update(post_params)
        render json: @post
      else
        render json: @post.errors
      end
  end

  # DELETE /posts/1.json
  def destroy
    render json: @post.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_id(params[:id]) || []
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:post).permit(:title)
    end
end