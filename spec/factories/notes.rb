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

FactoryGirl.define do
  factory :note do
    title "MyString"
    description "MyString"
    lat 1.5
    long 1.5
    references ""
  end
end
