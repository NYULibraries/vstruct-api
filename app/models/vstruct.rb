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
#

class Vstruct < ActiveRecord::Base
end
