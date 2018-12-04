require 'rails_helper'

RSpec.describe HomePageViewModel do
  describe '#featured_post' do
    subject { described_class.new.featured_post }

    it { is_expected.to be_nil }

    context 'when posts exist' do
      let!(:post1) { create :post }
      let!(:post2) { create :post }

      it { is_expected.to eq(post2) }
    end
  end

  describe '#new_posts' do
    subject { described_class.new.new_posts }

    it { is_expected.to be_empty }

    context 'when posts exist' do
      let!(:post1) { create :post }
      let!(:post2) { create :post }

      it { is_expected.to eq([post1]) }

      context 'when there are more than 3 posts' do
        let!(:post3) { create :post }
        let!(:post4) { create :post }
        let!(:post5) { create :post }

        it { is_expected.to eq([post4, post3, post2]) }
      end
    end
  end

  describe '#popular_posts' do
    subject { described_class.new.popular_posts }

    it { is_expected.to be_empty }

    context 'when posts exist' do
      let!(:post1) { create :post }
      let!(:post2) { create :post }
      let!(:post3) { create :post }
      let!(:post4) { create :post }

      it { is_expected.to eq([post4, post3, post2]) }

      context 'when comments exist' do
        let!(:post1_comments) { create_list :comment, 2, post: post1 }
        let!(:post2_comment) { create :comment, post: post2 }

        it { is_expected.to eq([post1, post2, post4]) }
      end
    end
  end
end
