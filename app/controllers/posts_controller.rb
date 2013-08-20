class PostsController < ApplicationController
  before_filter :find_post, only: [:show, :edit, :update, :destroy]
  # GET /posts
  def index
    @posts = Post.page(params[:page]).per_page(20)
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to @post
      flash[:notice] = 'Post was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /posts/1
  def update
    if @post.update_attributes(params[:post])
      redirect_to @post
      flash[:notice] = 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
    def find_post
      @post = Post.find(params[:id])
    end
end
