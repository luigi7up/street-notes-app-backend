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

require 'rails_helper'

RSpec.describe Note, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
