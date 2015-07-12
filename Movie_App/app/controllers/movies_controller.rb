class MoviesController < ApplicationController
  def index
  	@movies = Movie.all
  end


  def new
  	@movies = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = 'Movie saved'
      redirect_to movies_path
    else
      render :new
    end
  end

  def search
    @movies = Movie.where("title || year_released like ?", "%#{params[:search]}")
    puts @movies
  end



  def show
  	@movies = Movie.find(params[:id])
  end

  def edit
  	@movie = Movie.find(params[:id])
  end

  def update
  	@movie = Movie.find(params[:id])
  	if Movie.update(movie_params)
  		redirect_to movie_path(@movie)
  	else
  		render :edit
  	end
  end


  private
  def movie_params
	params.require(:movie).permit(:title, :description, :year_released)
  end
end
