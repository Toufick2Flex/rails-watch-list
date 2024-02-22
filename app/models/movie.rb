  class Movie < ApplicationRecord

    #validation
    validates :title, presence: true, uniqueness: true
    validates :overview, presence: true

    has_many :bookmarks

  end
