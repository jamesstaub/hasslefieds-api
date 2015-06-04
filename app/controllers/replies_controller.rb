class RepliesController < ApplicationController
  # GET /replies
  def index
    # all the replies
    @replies = Reply.all
    render json: @replies
  end

  # GET /replies/:id
  def show
    # find one Replyby id
    @reply = Reply.find(params[:id])
    render json: @reply
  end

  # POST /replies
  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      render json: @reply, status: :created, location: replies_url
    else
      render json: @reply.errors, status: :unprocessable_entity
     end
  end

  # PATCH /replies/:id
  def update
    @reply = Reply.find(params[:id])
    if @reply.update(reply_params)
      head :no_content
    else
      render json: @reply.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replies/:id
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    head :no_content
  end

  private
   def reply_params
    params.require(:reply)
      .permit(:body, :user_id, :post_id)
  end

end

