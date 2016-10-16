# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  note_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Image < ActiveRecord::Base
  belongs_to :note
  before_save :upload_to_cloudinary

  def upload_to_cloudinary
    begin
      response = Cloudinary::Uploader.upload("data:image/png;base64,#{base64}")
      self.url = response["url"]
      # RETURNS
      # {"public_id"=>"zhdj006iuwi8crx7mvdk",
      #  "version"=>1464694353,
      #  "signature"=>"d02942037de45e86cab0a5278ce123e449345dd4",
      #  "width"=>900,
      #  "height"=>900,
      #  "format"=>"png",
      #  "resource_type"=>"image",
      #  "created_at"=>"2016-05-31T11:32:33Z",
      #  "tags"=>[],
      #  "bytes"=>27914,
      #  "type"=>"upload",
      #  "etag"=>"6f17fce6ac317fbfc140c0f51c9db119",
      #  "url"=>"http://res.cloudinary.com/dpm6ilubu/image/upload/v1464694353/zhdj006iuwi8crx7mvdk.png",
      #  "secure_url"=>"https://res.cloudinary.com/dpm6ilubu/image/upload/v1464694353/zhdj006iuwi8crx7mvdk.png"}
    rescue => ex
        p ex.message
        logger.error ex.message

      return false
    end
    return true
  end
end
