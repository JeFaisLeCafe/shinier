class Disease < ApplicationRecord
  has_many :questions, dependent: :nullify
  has_many :users, dependent: :nullify

  # no validation since users can't modify it
  # DISEASES = Disease.all.map{&:name}

end

