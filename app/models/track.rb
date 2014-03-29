class Track < ActiveRecord::Base
	belongs_to :playlist
	belongs_to :record_label
	belongs_to :artist
	belongs_to :album
end
