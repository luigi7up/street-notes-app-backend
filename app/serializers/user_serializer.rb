# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  api_key    :string(255)
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
end
