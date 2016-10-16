class ImageSerializer < ActiveModel::Serializer
  attributes :url, :base64
  # has_one :note
end
