require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Event, type: :policy do
  let(:event) { create :event }

  subject { EventPolicy }

  context 'when user in not an owner' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end

    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end
  end

  context 'when user in an owner' do
    let(:user) { create :user }
    let(:event) { create(:event, user: user) }

    permissions :show? do
      it { is_expected.to permit(user, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
