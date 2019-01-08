require 'rails_helper'

RSpec.describe CourseEditionsController do
  let(:course_edition) { create :course_edition }

  describe 'POST #add_to_cart' do
    subject { post :add_to_cart, params: { id: course_edition.id } }

    before do
      allow(AddToCart).to receive(:run).and_return(outcome)
    end

    context 'when guest can add item to cart' do
      let(:outcome) { instance_double(AddToCart, valid?: true) }

      it do
        subject
        expect(controller.flash[:notice]).to eq('Dodano do koszyka')
      end

      it do
        expect(subject).to redirect_to(courses_path)
      end
    end

    context 'when guest can not add item to cart' do
      let(:outcome) { instance_double(AddToCart, valid?: false, errors: errors) }
      let(:errors) { Struct.new(:full_messages).new('Item is not available') }

      it do
        subject
        expect(controller.flash[:notice]).to eq('Item is not available')
      end

      it do
        expect(subject).to redirect_to(courses_path)
      end
    end
  end
end
