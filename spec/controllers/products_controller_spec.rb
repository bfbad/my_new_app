require 'rails_helper'

describe ProductsController, type: :controller do
  context 'GET #index' do
    before do
      get :index
    end
    it 'responds succssfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:products)).to eq(Product.all)
    end
  end
  context 'GET #index with params' do
    before do
      get :index, params: {q: "freckle"}
    end
    it 'returns the search results' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(assigns(:products)).to eq(Product.search("freckle", false))
    end
  end
  context 'GET #show' do
    before do
      @product = FactoryGirl.create(:product)
      $redis.set("product:#{@product.id}", 0)
      get :show, params: {id: @product.id}
    end
    it 'shows the product' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it 'counts a view' do
      expect(@product.views).to eq "1"
    end
  end
  context 'POST #create' do
    before do 
      post :create, params: {product: {name: 'My Product'}}
    end
    it 'creates the product' do
      expect(assigns(:product)).to be_a(Product)
    end
  end
  context 'POST #create with no name' do
    before do
      post :create, params: {product: {name: nil}}
    end
    it 'does not create the product' do
      expect(assigns(:product)).not_to be_valid
    end
    it 'renders new page' do
      expect(response).to render_template('new')
    end
  end
  context 'GET #new' do
    before do
      get :new
    end
    it 'responds successfully with HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it 'loads the new template' do
      expect(response).to render_template('new')
    end
    it 'creates a new product' do
      expect(assigns(:product)).to be_a_new(Product)
    end
  end
  context 'PATCH #update' do
    before do 
      @product = FactoryGirl.create(:product)
      patch :update, params:{id: @product.id, product: {name: "dog"}}
      @product.reload
    end
    it 'should update the name' do
      expect(@product.name).to eq "dog"
    end
    it 'should redirect to products' do
      expect(response).to redirect_to "/products"
    end
  end
  context 'PATCH #update with no name' do
    before do 
      @product = FactoryGirl.create(:product)
      @old_name = @product.name
      patch :update, params:{id: @product.id, product: {name: nil}}
      @product.reload
    end
    it 'should not be successful' do
      expect(@product.name).to eq @old_name
    end
    context 'DELETE #destroy' do
      before :each do 
        @product = FactoryGirl.create(:product)
      end
      it 'deletes the product' do
        expect{delete :destroy, params: {id: @product.id}}.to change(Product, :count).by(-1)
      end
      it 'redirects to products#index' do
        delete :destroy, params: { id: @product }
        expect(response).to redirect_to products_url
      end
    end
  end
end
