class GenresController < ApplicationController

    def index
        @genres = Genre.all
    end

    def new
        @genre = Genre.new
        
    end

    def show
        @genre = Genre.find(params[:id])
    end
    
    def create
        @genre = Genre.new(gen_params(:name))
        @genre.save
        redirect_to genres_path
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        if @genre.update(gen_params(:name))
            redirect_to genre_path(@genre)
        else
            render :edit
        end
    end

    private

    def gen_params(*args)
        params.require(:genre).permit(*args)
    end

end
