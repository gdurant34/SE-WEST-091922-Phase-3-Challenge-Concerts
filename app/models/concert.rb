class Concert < ActiveRecord::Base
    belongs_to :venue
    belongs_to :band

    def hometown_show?
        self.venue.city == self.band.hometown ? true : false
    end

    def introduction
        "Hello #{self.venue.city}!!!!! We are #{self.band.name} and we're from #{self.band.hometown}"
    end

end