class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end
    
    def show
        @artist = Artist.find(params[:id])

    end

    def new
        @artist = Artist.new
    end
    
    def create
        @artist = Artist.new(art_params(:name, :bio))
        @artist.save
        redirect_to artist_path(@artist)
    end

    def update
        @artist = Artist.find(params[:id])
        if @artist.update(art_params(:bio))
        redirect_to artist_path(@artist)
        else
            render :edit
        end
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    private

    def art_params(*args)
        params.require(:artist).permit(*args)
    end
end
