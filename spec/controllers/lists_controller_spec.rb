require 'rails_helper'


RSpec.describe ListsController, type: :controller do
  login_user

  describe 'GET #index' do
    it 'returns http success' do\
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'set list instance variable' do
      get :index
      expect(assigns(:lists).length).to eq(0)
    end

    it 'redirects the index template' do 
      get :index
      expect(response).to render_template(:index)
    end
    
    it 'ensures it retrieves the correct list for user' do
      get :index
      list = @user.lists.create(name: 'list1')
      expect(@user.lists.length).to eq(1)
    end
    
  end

  describe 'GET #show' do
    it 'returns http success' do 
      list = @user.lists.create(name: 'list1')
      get :show, params: { id: list.id }

      expect(response).to have_http_status(:success)
    end

    it 'set list instance variable' do
      list = @user.lists.create(name: 'list1')
      get :show, params: { id: list.id }

      expect(assigns(:list)).to eq(list)
    end
    
    it 'renders to show template' do
      list = @user.lists.create(name: 'list1')
      get :show, params: { id: list.id }

      expect(response).to render_template(:show)
    end
    
  end

  describe "GET #new" do 
    it 'return http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it 'set list instance variable' do
      get :new
      expect(assigns(:list)).to be_a_new(List)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end

  end


  describe 'POST create' do
    it 'returns HTTP redirect on success' do
      post :create, params: {user_id: @user.id, list: {name: 'list1'} }
      expect(response).to have_http_status(:redirect)
    end
    
    it 'set list instance variable' do
      name = 'test1'
      post :create, params: { list: {name: name} }

      expect(assigns(:list).name).to eq(name)
    end

    it 'redirects to list path if save successfull' do
      
      post :create, params: {user_id: @user.id, list: {name: 'list1'} }
      list = assigns(:list)
      
      expect(response).to redirect_to(list_path(list))
    end
    
    it 'renders new template if save is unsuccessful' do 
      post :create, params: { list: {name: ''} }
      list = assigns(:list)
      
      expect(response).to render_template(:new)
    end

    it 'saved list to the database' do
      post :create, params: {user_id: @user.id, list: {name: 'list1'} }
      list = assigns(:list)

      expect(@user.lists.first.name).to eq('list1')
    end
    
  end
  
  describe 'GET #edit' do
    it 'return http success' do
      list = @user.lists.create(name: 'list1')
      get :edit, params: { id: list.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders edit template' do
      list = @user.lists.create(name: 'list1')
      get :edit, params: { id: list.id}

      expect(response).to render_template(:edit)
    end

    it 'sets the list instance variable' do
      list = @user.lists.create(name: 'list1')
      get :edit, params: { id: list.id}

      expect(@user.lists.first.name).to eq('list1')
    end
        
  end


  

  




end
