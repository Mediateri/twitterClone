class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "You have deleted the blog!"
  end

  def new 
    if params[:back]
      @blog = Blog.new(param_blog)
    else
      @blog = Blog.new
    end
  end

  def edit
  end

  def update
    if @blog.update(param_blog)
      redirect_to blogs_path, notice: "You have updated your blog!"
    else
      render :edit
    end
  end

  def show
  end
  def confirm
    @blog = Blog.new(param_blog)
    render :new if @blog.invalid?
  end

  def create
    @blog = Blog.create(param_blog)
    if @blog.save
      redirect_to blogs_path, notice: "You have created new blog!"
    else
      render :new
    end
  end

  private 
  def param_blog
    params.require(:blog).permit(:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
