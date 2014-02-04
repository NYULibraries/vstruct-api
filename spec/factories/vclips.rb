# == Schema Information
#
# Table name: vclips
#
#  id           :uuid             not null, primary key
#  vstruct_id   :uuid
#  time_in      :string(255)
#  time_out     :string(255)
#  label        :string(255)
#  clip_type    :string(255)
#  clip_order   :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vclip do
    vstruct_id ""
    time_in "2014-02-03 15:04:35"
    time_out "2014-02-03 15:04:35"
    label "MyString"
    clip_type ""
    clip_order 1
    lock_version 1
  end
end
