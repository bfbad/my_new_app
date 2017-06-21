require 'rails_helper'

describe StaticPagesController, type: :controller do 
  context 'GET #index' do
    before do
      get :index
    end
    it 'responds succssfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do 
      expect(response).to render_template('index')
    end
  end
  context 'POST #thank_you' do
    before do
      post :thank_you, {params: {name: "joe schmoe", email: "joe@schmoe.co", message: "great bikes"}}
    end
    it 'responds successfully' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end 
  context 'GET #landing_page' do
    before do
      get :landing_page
    end
    it 'responds succesfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it 'renders the landing page template' do
      expect(response).to render_template('landing_page')
    end
  end
end