FactoryBot.define do
  factory :purchase_address do
    postal_code         { '111-2222' }
    house_number        { '青山1-1-1' }
    city                { '横浜市緑区' }
    building            { '柳ビル' }
    tel                 { '09012345678' }
    state_id            { '2' }
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
