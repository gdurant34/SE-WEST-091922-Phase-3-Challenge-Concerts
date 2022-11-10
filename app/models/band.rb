class Band < ActiveRecord::Base
    has_many :concerts
    has_many :venues, through: :concerts

    def play_in_venue(venue, date)
        self.concerts.create(date: date, venue: venue)
    end

    def all_introductions
        # self.reviews.map {|r| r.full_review}
        self.concerts.map {|concert| concert.introduction}
    end

    def self.most_performances
        # Customer.preload(:reviews).max_by {|customer| customer.reviews.length}
        self.preload(:concerts).max_by {|band| band.concerts.length}
    end

end