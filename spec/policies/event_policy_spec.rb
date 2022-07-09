require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Event, type: :policy do
  let(:event) { create :event }
  let(:user_context) { UserContext.new({}, {})}

  subject { EventPolicy }

  context 'when user in not an owner and pincode = nil' do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user_context, event) }
    end

    permissions :show? do
      it { is_expected.to permit(nil, event) }
    end
  end

  context 'when user in not an owner and pincode = true' do
    let(:event) { create :event, pincode: '1'}
    let(:user_context) { UserContext.new({}, "events_#{event.id}_pincode")}

    before(:each) do
      event.pincode = user_context.cookies
    end

    permissions :show? do
      it { is_expected.to permit(user_context, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user_context, event) }
    end
  end

  context 'when user owner and pincode = nil' do
    let(:user) { create :user }
    let(:user_context) { UserContext.new(user, {})}
    let(:event) { create :event, user: user }

    permissions :show? do
      it { is_expected.to permit(user_context, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user_context, event) }
    end
  end

  context 'when user owner and pincode = true' do
    let(:user) { create :user }
    let(:user_context) { UserContext.new(user, "events_#{event.id}_pincode")}
    let(:event) { create :event, pincode: '1', user: user }

    before(:each) do
      event.pincode = user_context.cookies
    end

    permissions :show? do
      it { is_expected.to permit(user_context, event) }
    end

    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user_context, event) }
    end
  end
end