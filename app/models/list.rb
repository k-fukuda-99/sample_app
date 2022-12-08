class List < ApplicationRecord

  # ActiveStorageを利用できるようにする
  # Listモデルにtitleとbodyに加えて画像を扱うためのimageカラムが追記されたかのように扱うことができます。
  has_one_attached :image
end
