require 'rails_helper'

RSpec.describe AddToCart do
  let(:course_edition) { create :course_edition }
  let(:guest) { create :guest }

  describe '.run' do
    subject { described_class.run(guest: guest, course_edition: course_edition) }

    it do
      order_items = guest.cart.order_items
      expect { subject }.to change { order_items.reload.size }.by(1)
    end
  end
end
