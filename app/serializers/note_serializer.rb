# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  lat         :float
#  long        :float
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#
class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :user
  has_many :images
end
