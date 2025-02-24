class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!, only: [:create, :edit, :update, :destroy]
  before_action :set_restaurant
  before_action :set_review
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :is_matching_login_customer, only: [:edit, :update, :destroy]

  def create
    @comment = @review.comments.new(comment_params)
    @comment.customer = current_customer
    
    if @comment.save
      flash[:notice] = "コメントを投稿しました。"
      redirect_to restaurant_review_path(@restaurant, @review)
    else
      flash[:alert] = "コメントの投稿に失敗しました。"
      @comments = @review.comments
      render "public/reviews/show"
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "コメントが更新されました。"
      redirect_to restaurant_review_path(@restaurant, @review)
    else
      flash[:alert] = "コメントの更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to restaurant_review_path(@restaurant, @review)
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = @restaurant.reviews.find(params[:review_id])
  end

  def set_comment
    @comment = @review.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)  # content はコメントの内容
  end

  def is_matching_login_customer
    unless @comment.customer == current_customer
      redirect_to restaurant_review_path(@restaurant, @review), alert: "権限がありません。"
    end
  end

end
