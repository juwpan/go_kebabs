require 'rails_helper'
require 'support/factory_bot'

RSpec.describe User, type: :model do
  describe '.create_from_provider_data' do
    # Создаём объект :access_token
    # В него записываем те данные, которые мы доставали их хеша
    let(:access_token) do
      double(
        :access_token,
        provider: 'github',
        info: double(email: 'juwpan@gmail.com', name: 'sergik', image: File.open('spec/factories/images/1.jpg')),
        extra: double(raw_info: double(id: '10213477015136709'))
      )
    end
    
    # Ситуация: пользователь не найден
    context 'when user is not found' do
      it 'returns newly created user' do
        user = User.create_from_provider_data(access_token)

        expect(user).to be_persisted
        expect(user.email).to eq 'juwpan@gmail.com'
      end
    end

    # Ситуация: юзер найден по почте
    context 'when user is found by email' do
      let!(:existing_user) { create(:user, email: 'juwpan@gmail.com') }
      let!(:some_other_user) { create(:user) }

      it 'returns this user' do
        expect(User.create_from_provider_data(access_token)).to eq existing_user
      end
    end

    # Ситуация: юзер найден по провайдеру и урлу
    context 'when user is found by email + provider + url' do
      let!(:existing_user) do
        create(:user, email: 'juwpan@gmail.com', provider: 'github',
              uid: 'https://github.com/10213477015136709')
      end
      let!(:some_other_uer) { create(:user) }

      it 'returns this user' do
        expect(User.create_from_provider_data(access_token)).to eq existing_user
      end
    end
  end
end
