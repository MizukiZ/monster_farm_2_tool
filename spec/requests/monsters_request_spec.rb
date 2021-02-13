require 'rails_helper'

RSpec.describe "Monsters", type: :request do
  let!(:monster_A) { FactoryBot.create(:monster_with_parameter) }
  let!(:monster_B) { FactoryBot.create(:monster_with_parameter) }

  it 'should get all monster data' do
    get monsters_path, params: { format: :json }

    expect(JSON.parse(response.body)['monsters'].length).to eq(Monster.all.length)
  end

  it 'should get one monster by id' do
    get monster_path(monster_A), params: { format: :json }
    expect(monster_A).to eq(monster_A)
    expect(response).to have_http_status(200)
  end
end
