class Show < ActiveRecord::Base
  def self.highest_rating
    # return the highest value in the ratings column.
    self.maximum(:rating)
  end

  def self.most_popular_show
    #return the show with the highest rating
    self.find_by rating: self.highest_rating
  end

  def self.lowest_rating
    # returns the lowest value in the ratings column.
    self.minimum(:rating)
  end

  def self.least_popular_show
    self.find_by rating: self.lowest_rating
  end

  def self.ratings_sum
    self.all.sum(:rating)
  end

  def self.popular_shows
    # returns an array of all of the shows that have a rating greater than
    self.where('rating > 5')
  end

  def self.shows_by_alphabetical_order
    self.order(:name)
  end
end
