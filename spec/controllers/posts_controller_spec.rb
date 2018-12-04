require 'rails_helper'

RSpec.describe PostsController do
  let(:post) { create :post }

  describe 'GET #show' do
    subject { get :show, params: { id: post.id } }

    it do
      expect(subject.status).to eq(200)
    end

    it do
      subject
      expect(assigns(:comments)).to eq([])
    end

    context 'with comments' do
      let!(:visible_comment) { create :comment, post: post }
      let!(:hidden_comment) { create :comment, post: post, hidden: true }

      it do
        subject
        expect(assigns(:comments)).to eq([visible_comment])
      end
    end
  end
end
