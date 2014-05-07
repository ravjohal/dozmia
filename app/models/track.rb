class Track < ActiveRecord::Base
  belongs_to :playlist


  has_attached_file :audio
                # :url  => ":class/:attachment/:id/:style/:filename", # for some reason these ulr and path vars don't work!
                # :path => ":class/:attachment/:id/:style/:filename"
                 # TODO: default_url =>  Need a default photo to show when no photo is chosen!

  validates_attachment_content_type :audio, :content_type => ['audio/mp3'] #[ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio' ]
  #do_not_validate_attachment_file_type :audio
  #validates_presence_of :audio
end
