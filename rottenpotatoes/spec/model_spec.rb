require 'rails_helper'

describe Movie, 'others_by_same_director' do
  
  it 'find other movies with the same director' do
    m1 = Movie.create(:title => 'm1', :director => 'd1')
    m2 = Movie.create(:title => 'm2', :director => 'd1')
    res = m1.others_by_same_director
    expect(res.to_s).to match(/m2/)
  end
  
  it 'find other movies with different director' do
    m1 = Movie.create(:title => 'm1', :director => 'd1')
    m2 = Movie.create(:title => 'm2', :director => 'd2')
    res = m1.others_by_same_director
    expect(res.to_s).not_to match(/m2/)
  end

end
