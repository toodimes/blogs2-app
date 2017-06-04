class PostsController < ApplicationController

  def index
    @bloggers = User.limit(5).order(id: :asc)
    @popular_posts = Post.limit(3).order(likes: :desc).where(is_published: true)
    @recent_posts = Post.limit(3).order(id: :desc).where(is_published: true)
    render "index.html.erb"
  end

  def like
    @post = Post.find_by(id: params[:id])
    @post.increase_likes
    @post.save
    redirect_to "/posts/#{@post.id}"
  end

  def new
    if current_user
      @post = Post.new
      render "new.html.erb"
    else
      flash[:info] = "You must be signed in to post"
      redirect_to "users/sign_in"
    end
  end

  def create
    @post = Post.create(
      user_id: current_user.id, 
      title: params[:title], 
      content: simple_format(params[:content])
    )
    @img = PostImage.new(
      post_id: @post.id,
      user_id: current_user.id,
      url: params[:image],
      description: params[:img_description]
    )
    if @post.save && @img.save
      flash[:success] = "Your post has been added but is not yet published"
      redirect_to "/posts/#{@post.id}/edit"
    else
      render "new.html.erb"
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @post.increase_views
    @post.save
    render "show.html.erb"
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(title: params[:title], content: params[:content], is_published: true)
    redirect_to "/posts/#{@post.id}"
  end

  def destroy

  end
end
