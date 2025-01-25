class Public::SearchesController < ApplicationController

  def genre_search
    @genre = Genre.find(params[:genre_id]) if params[:genre_id].present?
    @genres = Genre.all
    @restaurants = if params[:genre_id].present?
      Restaurant.where(genre_id: params[:genre_id])
    else
      Restaurant.all
    end
  end

  def keyword_search
    @keyword = params[:keyword].to_s.strip.gsub(/[\s　]+/, " ")
    @genres = Genre.all
    if @keyword.present?
      @restaurants = Restaurant.search_by_keyword(@keyword)
    else
      redirect_to restaurants_path
    end

  end

end
