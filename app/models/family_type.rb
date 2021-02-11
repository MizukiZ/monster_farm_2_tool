# == Schema Information
#
# Table name: family_types
#
#  id         :bigint           not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class FamilyType < ApplicationRecord
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

  TYPES_IN_ENGLISH = [
    'PIXIE', 'DRAGON', 'CENTAUR', 'COLOR_PANDORA', 'BEACLON',
    'HENGER', 'WRACKY', 'GOLEM', 'ZUUM', 'DURAHAN',
    'ARROW_HEAD', 'TIGER', 'HOPPER', 'HARE', 'BAKU',
    'GALI', 'KATO', 'ZILLA', 'BAJARL', 'MEW',
    'PHOENIX', 'GHOST', 'METALNER', 'SUEZO', 'JILL',
    'MOCCHI', 'JOKER', 'GABOO', 'JELL', 'UNDINE',
    'NITON', 'MOCK', 'DUCKEN', 'PLANT', 'MONOL',
    'APE', 'WORM', 'NAGA',
  ]

  
  has_many :monsters_as_main, foreign_key: "main_family_type_id", class_name: "Monster"
  has_many :monsters_as_sub, foreign_key: "sub_family_type_id", class_name: "Monster"

  validates :name, presence: true
  validates :name, inclusion: { in: TYPES }
end
