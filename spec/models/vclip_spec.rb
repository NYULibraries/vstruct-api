# == Schema Information
#
# Table name: vclips
#
#  id           :uuid             not null, primary key
#  vstruct_id   :uuid
#  time_in      :time
#  time_out     :time
#  label        :string(255)
#  clip_type    :string(255)
#  clip_order   :integer
#  lock_version :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'spec_helper'

describe Vclip do
  pending "add some examples to (or delete) #{__FILE__}"
end
