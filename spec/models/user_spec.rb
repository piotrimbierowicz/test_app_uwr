require 'rails_helper'

RSpec.describe User do
  let(:user) { create :user }

  describe '#display_name' do
    it do
      expect(user.display_name).to eq(user.email)
    end

    it do
      user.update username: 'test_username'
      expect(user.display_name).to eq('test_username')
    end
  end
end
