require 'rails_helper'

RSpec.describe UserAuthenticator do
  let(:email) { 'a@a.com' }
  let(:name) { 'john' }
  let(:user) { double('User') }
  let(:auth0_uid) { '1234' }
  let(:auth0_info) { { email: email, name: name }.with_indifferent_access }

  let(:authenticator) do
    described_class.new(
      auth0_uid: auth0_uid,
      auth0_info: auth0_info,
    )
  end

  before do
    allow(User).to receive(:find_by) { user }
    allow(user).to receive(:present?) { true }
    allow(user).to receive(:update) { true }
  end

  describe '#call' do
    before do
    end

    context 'when new user' do
      let(:new_user) { double('NewUser') }

      before do
        allow(user).to receive(:present?) { false }
        allow(new_user).to receive(:update) { true }
      end

      subject { authenticator.call }

      it { expect(subject.new_user?).to eql true }

      it 'creates a new user' do
        expect(User).to receive(:create).with(
          auth0_uid: auth0_uid,
          email: email,
          name: name,
        ).and_return(new_user)

        subject
      end

      it 'returns a new user' do
        allow(User).to receive(:create) { new_user }

        expect(subject.user).to eql new_user
      end
    end

    context 'when user present' do
      subject { authenticator.call }

      it { expect(subject.new_user?).to eql false }
      it { expect(subject.user).to eql user }
    end

    it 'updates the user last_auth_at' do
      time_now = Time.now

      allow(Time).to receive(:now) { time_now }

      expect(user).to receive(:update).with(
        last_auth_at: time_now,
      )

      authenticator.call
    end
  end
end
