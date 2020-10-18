FactoryBot.define do
  factory :item do
      title               { 'トートバッグ' }
      text                { '2018年に購入しました。未開封、暗所にて保管。外装に傷はありません。' }
      price               { '2000' }
      genre_id            { '5'}
      item_status_id      { '4' }
      delivery_charge_id  { '2' }
      state_id            { '15' }
      delivery_days_id    { '3' }
      association :user

      after(:build) do |item|
        item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
