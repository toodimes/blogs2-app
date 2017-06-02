class PostsController < ApplicationController

  def index
    if current_user
      @bloggers = User.where("id != ?", current_user.id)
    else
      @bloggers = User.all
    end
    render "index.html.erb"
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
    @post = Post.new(user_id: current_user.id, title: params[:title], content: params[:content])
    if @post.save
      flash[:success] = "Your post has been added but is not yet published"
      redirect_to "posts/#{@post.id}/edit"
    else
      render "new.html.erb"
    end
  end

  def show
    render "show.html.erb"
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(is_published: true)
    render "posts/#{post.id}"
  end

  def destroy

  end
end
