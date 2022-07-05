require 'rails_helper'
require 'support/factory_bot'

RSpec.describe Event, type: :policy do
  let(:user) { create :user }

  # объект тестирования (политика)
  subject { EventPolicy }

  permissions :create? do
    it { is_expected.to permit(user, Event) }
    it { is_expected.not_to permit(nil, Event) }
  end
end

