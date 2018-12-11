require 'rails_helper'

RSpec.describe CoursesProvider do
  let!(:course1) { create :course, name: 'Frontend Developer' }

  describe '#results' do
    subject { described_class.new(key).results }

    context 'when key is lowercased' do
      let(:key) { 'fron' }

      it { is_expected.to include(course1) }
    end

    context 'when key is a prefix' do
      let(:key) { 'Fron' }

      it { is_expected.to include(course1) }
    end

    context 'when key is in the middle' do
      let(:key) { 'Dev' }

      it { is_expected.to include(course1) }
    end

    context 'when key is empty' do
      let(:key) { '' }

      it { is_expected.to be_blank }
    end

    context do
      let(:key) { 'developer front' }

      it { is_expected.to include(course1) }
    end

    context do
      let(:key) { 'frontend developers' }

      it { is_expected.to include(course1) }
    end
  end
end
