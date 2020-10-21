# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'schema' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:username).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:tasks) }
  end

  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it 'is valid with a username, email' do
    expect(create(:user)).to be_valid
  end

  it 'is invalid without a username' do
    user = FactoryBot.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid without an email' do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('test.errors.blank'))
  end

  it 'is invalid with a duplicate email address' do
    FactoryBot.create(:user, email: I18n.t('test.email'))
    user = FactoryBot.build(:user, email: I18n.t('test.email'))
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('test.errors.taken'))
  end

  it 'is invalid with a duplicate username' do
    FactoryBot.create(:user, username: I18n.t('test.username'))
    user = FactoryBot.build(:user, username: I18n.t('test.username'))
    user.valid?
    expect(user.errors[:username]).to include(I18n.t('test.errors.taken'))
  end

  it 'is invalid with a wrong email address' do
    user = FactoryBot.build(:user, email: I18n.t('test.wrong_email'))
    user.valid?
    expect(user.errors[:email]).to include(I18n.t('test.errors.invalid_email'))
  end
end
