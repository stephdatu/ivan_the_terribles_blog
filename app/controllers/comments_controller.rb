class CommentsController < ApplicationController
  before_filter :find_post
  before_filter :find_comment, only: [:show, :edit, :update, :destroy]
  # GET /comments
  def index
    @comments = Post.comments.(params[:page]).per_page(10)
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      redirect_to [@post, @comment]
      flash[:notice] = 'Comment was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /comments/1
  def update
    if @comment.update_attributes(params[:comment])
      redirect_to [@post, @comment]
      flash[:notice] = 'Comment was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to @post
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end

    def find_comment
      @comment = @post.comments.find(params[:id])
    end
end
