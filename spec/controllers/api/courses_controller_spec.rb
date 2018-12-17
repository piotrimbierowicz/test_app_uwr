require 'rails_helper'

RSpec.describe Api::CoursesController do
  describe 'GET #index' do
    subject { get :index, params: { key: key } }
    let(:key) { 'Front' }

    let!(:course) { create :course, name: 'Frontend Developer' }

    it do
      expect(subject).to be_successful
      expect(JSON.parse(subject.body))
        .to eq([{ 'id' => course.id, 'name' => course.name }])
    end
  end
end
