class Venue < ActiveRecord::Base
    has_many :concerts
    has_many :bands, through: :concerts

    def concert_on(date)
        # Venue.first.concerts
        # .concerts.find_by(date: "2018-05-14")
        self.concerts.find_by(date: date)
    end

    def most_frequent_band
        self.band.max_by {|band| band.concert}
        # self.preload(:band).max_by {|band| band.length}
    end

    # def self.most_performances
    #     # Customer.preload(:reviews).max_by {|customer| customer.reviews.length}
    #     Band.preload(:concerts).max_by {|band| band.concerts.length}
    # end


end