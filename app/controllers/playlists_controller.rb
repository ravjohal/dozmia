require "mp3info"

class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /playlists
  # GET /playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
    render action: 'edit'
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    #track = @playlist.tracks.build
    #@track = Track.new
    # 1.times do
    #   track = @playlist.tracks.build
    # end
    # track_once = Track.new
  end

  # GET /playlists/1/edit
  def edit
    #track = @playlist.tracks
    # track.build_artist
    # track.build_album
    # track.build_record_label
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
   # puts " this is the tracks: " + params[:playlist][:audio][0].path.to_s
    tracks = @playlist.tracks

   #  Mp3Info.open(params[:playlist][:audio][0].path.to_s) do |info|
   #    # puts "title: " + info.tag.title
   #    # puts "artist: " + info.tag.artist
   #    # puts "artist: " + info.tag.album
   #    # puts "tracknum: " + info.tag.tracknum.to_s
   #    track.audio_file_name = info.tag.title
   #    track.artist = info.tag.artist
   #    track.album  = info.tag.album
   #    # tracknum = info.tag.tracknum.to_s
   #  end
   puts "TRACKS: " + tracks.to_s
    puts " this is the tracks: " + params[:playlist][:tracks_attributes]["0"][:audio].to_s
   #tracks = {}
   index = 0

   audio_files = params[:playlist][:tracks_attributes]["0"][:audio];

   audio_files.each do |audio|
    puts " THIS IS EACH AUDIO : " + audio.to_s
    puts "this is the INDEXXXXXXXXXXXX : " + index.to_s
      Mp3Info.open(audio.path.to_s) do |info|
        # puts "title: " + info.tag.title
        # puts "artist: " + info.tag.artist
        # puts "artist: " + info.tag.album
        # puts "tracknum: " + info.tag.tracknum.to_s
        if index == 0   
          tracks[0].audio_file_name = info.tag.title
          tracks[0].artist = info.tag.artist
          tracks[0].album = info.tag.album
          tracks[0].label = info.tag.label
        elsif 
          track = Track.new()
          track.audio_file_name = info.tag.title
          track.artist = info.tag.artist
          track.album  = info.tag.album
          track.label  = info.tag.label
          tracks << track
        end

        #puts " THIS IS THE NEW TRACK: " + track.audio_file_name.to_s
      end
      index += 1
    end

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render action: 'show', status: :created, location: @playlist }
      else
        format.html { render action: 'new' }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    #count = @playlist.tracks.find_all
    
    #track = @playlist.tracks(playlist[:tracks_attributes][0][:audio])
    #track = @playlist.tracks(playlist_params[:tracks_attributes][0])[0]
    #puts "TRACK INFO: " + track.audio_file_name
    #track = @playlist.tracks.new()
    Mp3Info.open(playlist_params["tracks_attributes"]["0"]["audio"].path.to_s) do |info|
      # puts "title: " + info.tag.title
      # puts "artist: " + info.tag.artist
      # puts "artist: " + info.tag.album
      # puts "tracknum: " + info.tag.tracknum.to_s
      params[:playlist][:tracks_attributes]["0"][:audio_file_name] = info.tag.title
      params[:playlist][:tracks_attributes]["0"][:artist] = info.tag.artist
      params[:playlist][:tracks_attributes]["0"][:album]  = info.tag.album
      params[:playlist][:tracks_attributes]["0"][:label]  = info.tag.label
      # tracknum = info.tag.tracknum.to_s
    end
    

    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    # @playlist.tracks.each do |track|
    #   track
    # end
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:name, :description, :photo, :photo_file_name, :photo_content_type, :photo_file_size,
          :tracks_attributes => [:id, :title, :artist, :album, :label, :ismn_num, :total_plays, :playlist_id, :audio, :audio_file_name, :audio_content_type, :audio_file_size])
    end
end
