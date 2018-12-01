require 'rails_helper'

RSpec.describe UserPanel::OrdersController do
  let(:user) { create :user }
  let(:order) { create :order, :pending, owner: user }

  before do
    sign_in user
  end

  describe 'PATCH #confirm' do
    subject { patch :confirm, params: order_params.merge(id: order.id) }

    let(:order_params) { { order: { comment: 'Order comment' } } }

    it do
      expect { subject }
        .to change { order.reload.status }.from(Order::PENDING_ORDER_STATUS).to(Order::CONFIRMED_ORDER_STATUS)
        .and change { order.reload.comment }.to('Order comment')

      expect(subject).to redirect_to(user_panel_order_path(order))
    end

    context 'when order is not pending' do
      let(:order) { create :order, :confirmed, owner: user }

      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'when order does not belong to user' do
      let(:order) { create :order, :pending }

      it { expect { subject }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
