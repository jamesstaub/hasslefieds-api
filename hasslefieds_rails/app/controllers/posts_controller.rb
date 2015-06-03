class PostsController < ApplicationController
  # GET /posts
  def index
    # all the posts
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/:id
  def show
    # find one Post by id
    @post = Post.find(params[:id])
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created # location: posts_url
    else
      render json: @post.errors, status: :unprocessable_entity
     end
  end

  # PATCH /posts/:id
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      head :no_content
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    head :no_content
  end

  private
   def post_params
    params.require(:post)
      .permit(:title, :body, :start_date, :end_date, :category, :price, :condition)
  end
end
