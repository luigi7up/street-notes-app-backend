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

class Note < ActiveRecord::Base
  belongs_to :user
  has_many :images
  accepts_nested_attributes_for :images

  # before_create :upload_to_cloudinary
end
