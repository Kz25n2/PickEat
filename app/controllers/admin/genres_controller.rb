class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    if params[:genre].blank?
      @genres = Genre.all
      flash[:alert] = "ジャンルを入力してください。"
      render :index and return
    end

    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
      flash[:notice] = "ジャンルを作成しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      flash.now[:alert] = "ジャンルの作成に失敗しました"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを更新しました"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンルの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    flash[:notice] = "ジャンルの削除に成功しました"
    redirect_to admin_genres_path
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
