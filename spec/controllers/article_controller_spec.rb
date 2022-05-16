require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  context 'GET articles#index' do
    it 'show us success' do
      get :index
      expect(response.status).to eq(200)
    end
  end
  context 'GET #show' do
    let(:article) { Article.create(title: 'zxc', body: 'zxc', tags: 'zxc') }
    it 'returns a succes response' do
      # /articles/{article-id}
      get :show, params: { id: article }
      expect(response.status).to eq(200)
    end
  end
end
