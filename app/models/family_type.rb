class FamilyType < ApplicationRecord
  has_many :monsters_as_main, foreign_key: "main_family_type_id", class_name: "Monster"
  has_many :monsters_as_sub, foreign_key: "sub_family_type_id", class_name: "Monster"

  TYPES = [
    'ピクシー', 'ドラゴン', 'ケンタウロス', 'コロペンドラ', 'ビークロン',
    'ヘンガー', 'チャッキー', 'ゴーレム', 'ロードランナー', 'デュラハン',
    'アローヘッド', 'ライガー', 'ホッパー', 'ハム', 'バクー',
    'ガリ', 'アーケロ', 'グジラ', 'バジャール', 'ニャー',
    'ヒノトリ', 'ゴースト', 'メタルナー', 'スエゾー', 'ジール',
    'モッチー', 'ジョーカー', 'ネンドロ', 'ゲル', 'ウンディーネ',
    'ナイトン', 'モック', 'ダックン', 'プラント', 'モノリス',
    'ラウー', 'ワーム', 'ナーガ',
  ]
end
