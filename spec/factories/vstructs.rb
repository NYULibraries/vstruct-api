# == Schema Information
#
# Table name: partners
#
#  id           :uuid             not null, primary key
#  code         :string(255)      not null
#  name         :string(255)
#  lock_version :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
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
