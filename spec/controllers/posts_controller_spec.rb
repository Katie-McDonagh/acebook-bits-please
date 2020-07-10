# frozen_string_literal: true
require 'rails_helper'
 RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe 'GET /new ' do

    it 'responds with 302' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new post" do
        expect {
          post :create, params: {user: valid_attributes}, session: valid_session
        }.to change(Post, :count).by(1)
      end
      it "redirects to the post wall" do
        post :create, params: {user: valid_attributes}, session: valid_session
        expect(response).to redirect_to(post_path)
      end
    end
  end

  describe "#create" do
    it "creates a post" do
      user = User.create! valid_attributes
      expect(Post).to receive(:create)
      get :create
    end
  end

  describe 'POST /' do
    it 'redirects user to post page' do
      user = User.create! valid_attributes
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end
  end

    it 'creates a post' do
      user = User.create! valid_attributes
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end

  describe 'GET /' do
    it 'responds with 200' do
      user = User.create! valid_attributes
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      user = User.create! valid_attributes
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      user = User.create! valid_attributes
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      user = User.create! valid_attributes
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(posts_url)
    end

    it 'creates a post' do
      user = User.create! valid_attributes
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end
 end
