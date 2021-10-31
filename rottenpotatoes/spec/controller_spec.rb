require 'rails_helper'

describe MoviesController, type: :controller do
  
  context 'when movie has a director' do
    it 'render director page' do
      m1 = Movie.create(:title => 'm1', :director => 'd1')
      m2 = Movie.create(:title => 'm2', :director => 'd1')
      get :search_directors, :id => m1
      expect(response).to render_template('search_directors')
    end
  end

  context 'when movie has no director' do
    it 'render index page' do
      m1 = Movie.create(:title => 'm1')
      get :search_directors, :id => m1
      expect(response).to redirect_to(movies_path)
      expect(flash[:notice]).to eq "\'m1\' has no director info"
    end
  end
  
end