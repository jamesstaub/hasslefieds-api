class PostsController < OpenReadController
  # GET /posts
  def index
    # all the posts
    @posts =  Post.where('start_date < ? AND end_date > ?', DateTime.now, DateTime.now)
    # render json: @posts
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
    @post = current_user.posts.new(post_params)
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
    if @post.user = current_user
      @post.destroy
    else
      render json: @post.errors, status: :unprocessable_entity
    end

    head :no_content
  end

  private
  def post_params
    params.require(:post)
      .permit(:title, :body, :start_date, :end_date, :category, :price, :condition)
  end




# when the new ajax is implemented with images
  #  def post_params
  #   params
  #     .permit(:title, :body, :start_date, :end_date, :category, :price, :condition)
  # end
end
