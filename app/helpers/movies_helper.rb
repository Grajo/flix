module MoviesHelper
    def total_gross(movie)
        if movie.flop?
            "Flop!"
        else
            number_to_currency(movie.total_gross, precision: 0)
        end
    end

    def year_of(movie)
        if (movie.released_on.blank?) 
            "No date provided"
        else
            movie.released_on.year
        end
    end
end
