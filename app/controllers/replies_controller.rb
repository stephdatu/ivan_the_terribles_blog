class RepliesController < ApplicationController
  before_filter :find_post
  before_filter :find_comment
  before_filter :find_reply, only: [:show, :edit, :update, :destroy]
  # GET /replies
  def index
    @replies = Comment.replies.all
  end

  # GET /replies/1
  def show
  end

  # GET /replies/new
  def new
    @reply = @comment.replies.build
  end

  # GET /replies/1/edit
  def edit
  end

  # POST /replies
  def create
    @reply = @comment.replies.build(params[:reply])

    if @reply.save
      redirect_to [@comment, @reply]
      flash[:notice] = 'Reply was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /replies/1
  def update
    if @reply.update_attributes(params[:reply])
      redirect_to [@comment, @reply]
      flash[:notice] = 'Reply was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /replies/1
  def destroy
    @reply.destroy
    redirect_to @comment
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def find_comment
      @comment = @post.comments.find(params[:id])
    end

    def find_reply
      @reply = @comment.replies.find(params[:id])
    end
end
