# == Schema Information
#
# Table name: vstructs
#
#  id                 :uuid             not null, primary key
#  label              :string(255)
#  streaming_fname    :string(255)
#  digitization_notes :text
#  status             :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  lock_version       :integer          default(0), not null
#

FactoryGirl.define do
  sequence(:label) { |n| "HI2199_#{n}" }

  factory :vstruct do
    label
    streaming_fname    'HI2199_123_800k_s.mp4'
    digitization_notes 'these are some digitization notes...'
    status             'ready'
  end

end
