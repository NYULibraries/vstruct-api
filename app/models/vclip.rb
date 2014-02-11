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
#  lock_version :integer          default(0), not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Vclip < ActiveRecord::Base
  belongs_to :vstruct
end
