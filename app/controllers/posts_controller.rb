class PostsController < ApplicationController
  def index
    @posts = Post.ordered.all
  end
end
