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

require 'spec_helper'

describe Vclip do
  pending "add some examples to (or delete) #{__FILE__}"
end
