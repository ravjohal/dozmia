require 'paperclip/media_type_spoof_detector'

module Paperclip
  class MediaTypeSpoofDetector
    def type_from_file_command
      begin
        Paperclip.run("file", "-b --mime :file", :file => @file.path)
      rescue Cocaine::CommandLineError
        ""
      end
    end
  end
end

# module Paperclip
#   class MediaTypeSpoofDetector
#     def spoofed?
#       false
#     end
#   end
# end

# config/initializers/paperclip.rb
    # only use Amazon S2 on production servers
    # unless Rails.env.development?
    #   Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
    #   Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'

    # # # config/initializers/paperclip.rb
    # # Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'
    # end

