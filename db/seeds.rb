prize = [
    "macbook Air",
    "ipad pro 128GB wifiモデル",
    "dyson Cyclone V10 Fluffy",
    "Nintendo Switchホワイト 有機EL",
    "選べる北海道海の幸ギフト",
    "Anker PowerCore III 19200 60W",
    "FUJIFILM インスタントカメラ チェキ",
    "松阪牛・神戸牛・米沢牛 選べるカタログギフト TMコース",
    "クオカード(３０００円)",
    "ホットアイマスク USB 電熱式 蒸気",
    "ベッドサイドランプ",
    "ブローハイ"
]

qty = [
    1,
    1,
    1,
    1,
    5,
    5,
    5,
    5,
    10,
    5,
    5,
    1
]

category = [
    "豪華",
    "豪華",
    "豪華",
    "豪華",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間",
    "中間"
]

prize.each_with_index do |p, cnt|
    Prize.create!(
        prize: p,
        qty: qty[cnt],
        category: category[cnt],
        image: "/images/noimage.png"
    )
end

Prize.create!(
    prize: "缶バッチ",
    qty: 2000,
    category: "参加賞",
    image: "/images/noimage.png"
)