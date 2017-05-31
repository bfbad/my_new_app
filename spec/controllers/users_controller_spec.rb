require 'rails_helper'

describe UsersController, type: :controller do
  # let(:user) { User.create!(email: "b@c.com", password: "123456", confirmed_at: Time.now) }
  user = FactoryGirl.create(:user)
  #let(:user2) { User.create(email: "test@tester123.com", password: "123456", confirmed_at: Time.now)}
  user2 = FactoryGirl.create(:user)
  describe 'GET #show' do
    context 'User is logged in' do
      before do 
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to be_success
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end
      it 'blocks user from accessing user2 details' do
        get :show, params: { id: user2.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end  
    end
    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
  describe 'GET #index' do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "assigns @user" do
      user3 = FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to eq([user, user2, user3])
    end
  end
end