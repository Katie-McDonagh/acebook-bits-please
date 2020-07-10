# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }
  let(:valid_session) { {} }

  subject {Post.new(message: "test post", user_id: "1", created_at: '2018-06-29 19:20', updated_at: '2018-06-29 19:25')}

  before { subject.save }

  it 'should have a user attached to the post' do
    user = User.create! valid_attributes
    post.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid if the post is blank' do
    user = User.create! valid_attributes
    post.message = nil
    expect(subject).to_not be_valid
  end

  it 'should not be valid without a created at timestamp' do
    user= User.create! valid_attributes
    created_at = nil
    expect(subject).to_not be valid
  end

  it 'should not be editable after 10 minutes' do
    user = User.create! valid_attributes
    post.updated_at = '2018-06-29 19:31'
    expect(subject).to_not be_valid
  end

  it 'should allow for line breaks' do
    user = User.create! valid_attributes
    post.message = 'hello/nworld'
    expect(subject).to be_valid
  end 
end
