class Playlist < ActiveRecord::Base
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
	:default_url => "/images/:style/missing.png" 
	#:path => “:class/:attachment/:id/:style/:filename”, 
	#:url => “:class/:attachment/:id/:style/:filename”

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
