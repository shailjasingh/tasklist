# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:avatar_url).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:task)).to be_valid
  end

  it 'is valid with a description, avatar url and user id' do
    expect(create(:task)).to be_valid
  end

  it 'is invalid without a user' do
    task = Task.create(description: I18n.t('test.description'))
    task.valid?
    expect(task.errors[:user]).to include(I18n.t('test.errors.user'))
  end

  it 'raise exception without a descripton' do
    expect { Task.create(user: create(:user)) }.to raise_error(ActiveRecord::NotNullViolation)
  end
end
