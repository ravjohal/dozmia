class Track < ActiveRecord::Base
	belongs_to :album
	belongs_to :playlist
	belongs_to :artist
	belongs_to :record_label

	accepts_nested_attributes_for :album, :artist, :record_label
end
