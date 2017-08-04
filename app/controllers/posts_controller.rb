class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice]= "Post Created Succesfully!"
      redirect_to posts_path
    else
      render :new
    end
  end
  def index
    @posts = Post.all
    # posts.each do |post|
    #   born = post.created_at
    #   now = Time.now
    #   age_s = now - born
    #   age_m = age_s/60
    #   rate = post.votes/age_m*0.1
    #   post.update(ranking:rate)
    # end
    # @posts = Post.all.order('id ASC').reorder('ranking DESC')
  end
  def show
    @post = Post.find(params[:id])
    @post.increment! :views
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice]= "Post Updated Succesfully!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice]= "Post Deleted Succesfully!"
    redirect_to posts_path
  end
  def rate
    @post = Post.find(params[:post])
    rating = params[:rating]
    count = @post.rating_count
    avg = @post.rating
    new_avg = ((count*avg)+rating)/(count+1)
    @post.increment! :rating_count
    @post.update(rating:new_avg)
    redirect_to post_path(@post)
  end

  private
  def post_params
    params.require(:post).permit(:user_id,:title,:image,:description)
  end
end
