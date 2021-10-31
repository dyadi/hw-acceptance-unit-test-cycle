class Movie < ActiveRecord::Base
  def others_by_same_director
    res = []
    Movie.where(director: self.director).each do |movie|
      if movie != self
        res += [movie]
      end
    end
    return res
  end
end
