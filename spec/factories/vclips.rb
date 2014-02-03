# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vclip do
    vstruct_id ""
    time_in "2014-02-03 15:04:35"
    time_out "2014-02-03 15:04:35"
    label "MyString"
    type ""
    clip_order 1
    lock_version 1
  end
end
