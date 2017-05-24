require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(email: "b@c.com", password: "123456", confirmed_at: Time.now) }
  let(:user2) { User.create!(email: "a@d.com", password: "123456", confirmed_at: Time.now)}
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
end