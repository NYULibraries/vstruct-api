require 'spec_helper'

# http://matthewlehner.net/rails-api-testing-guidelines/
describe "/api/v0/vclips", type: :api do
  include ApiHelper

  def specific_attributes
    { id:                 '939cbd89-9141-4afa-8afa-4280425d0d1a',
      vstruct_id:         '4a3bd8d5-6463-428f-bbcc-857ef35414c3',
      time_in:            '00:11:22.333',
      time_out:           '00:12:22.333',
      label:              'bars and tone',
      clip_type:          'calibration',
      clip_order:         1,
      lock_version:       1
    }
  end

  def non_specific_attributes
    { vstruct_id:         '4a3bd8d5-6463-428f-bbcc-857ef35414c3',
      time_in:            '00:12:22.334',
      time_out:           '00:13:22.333',
      label:              'boo',
      clip_type:          'content',
      clip_order:         2,
      lock_version:       1
    }
  end

  def validate_specific_vclip(json)
    expect(json['id']).to eq("939cbd89-9141-4afa-8afa-4280425d0d1a")
    expect(json['vstruct_id']).to eq("4a3bd8d5-6463-428f-bbcc-857ef35414c3")
    expect(json['time_in']).to eq("00:11:22.333")
    expect(json['time_out']).to eq("00:12:22.333")
    expect(json['label']).to eq("bars and tone")
    expect(json['clip_type']).to eq("calibration")
    expect(json['clip_order']).to eq(1)
    expect(json['lock_version']).to eq(1)
    expect(json['created_at']).not_to be_nil
    expect(json['updated_at']).not_to be_nil
  end

  def create_vstruct
    Vstruct.create!({id: "4a3bd8d5-6463-428f-bbcc-857ef35414c3"})
  end


  describe "GET /api/v0/vclips/<id>" do
    it "returns the correct vclip" do
      FactoryGirl.create :vclip, specific_attributes
      get "/api/v0/vclips/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(200)
      json = JSON.parse(last_response.body)
      validate_specific_vclip(json)
    end

    it "returns a 404 if the vclip is not found" do
      get "/api/v0/vclips/00000000-0000-4000-a000-000000000000"
      expect(last_response.status).to eql(404)
    end

    it "returns a 400 if the vclip id is badly formed" do
      get "/api/v0/vclips/00000000-0000-4000-a000-00000000000"
      expect(last_response.status).to eql(400)
    end
  end

  describe "POST /api/v0/vstructs/<vstruct_id>/vclips" do
    before(:each) { create_vstruct }
    context "with specific :id" do
      it "returns 201" do
        post "/api/v0/vstructs/#{specific_attributes[:vstruct_id]}/vclips", {vclip: specific_attributes}
        expect(last_response.status).to eql(201)
      end

      # hostname is www.example.com by default:
      # http://stackoverflow.com/questions/9706772/why-do-rails-tests-run-as-www-example-com
      # http://stackoverflow.com/questions/598933/how-do-i-change-the-default-www-example-com-domain-for-testing-in-rails
      # http://stackoverflow.com/questions/6536503/capybara-with-subdomains-default-host/7050306#7050306
      it "returns the correct Location header" do
        post "/api/v0/vstructs/#{specific_attributes[:vstruct_id]}/vclips", {vclip: specific_attributes}
        exp_str = "http://www.example.com/api/v0/vclips/" +
          specific_attributes[:id]
        expect(last_response.header['Location']).to eql(exp_str)
      end
    end

    context "without a specific :id" do
      it "returns 201" do
        h = non_specific_attributes
        post "/api/v0/vstructs/#{specific_attributes[:vstruct_id]}/vclips", {vclip: h}
        expect(last_response.status).to eql(201)
      end

      # hostname is www.example.com by default:
      # http://stackoverflow.com/questions/9706772/why-do-rails-tests-run-as-www-example-com
      # http://stackoverflow.com/questions/598933/how-do-i-change-the-default-www-example-com-domain-for-testing-in-rails
      # http://stackoverflow.com/questions/6536503/capybara-with-subdomains-default-host/7050306#7050306
      it "returns the correct Location header" do
        h = non_specific_attributes
        post "/api/v0/vstructs/#{specific_attributes[:vstruct_id]}/vclips", {vclip: h}

        expect(last_response.header['Location']).to match(/\Ahttp:\/\/www.example.com\/api\/v0\/vclips\/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\z/)
      end
    end
  end

  describe "PUT"
  describe "PATCH"

  describe "DELETE /api/v0/vclips/<:id>" do
    before(:each) { create_vstruct }

    it "returns 204" do
      post "/api/v0/vstructs/#{specific_attributes[:vstruct_id]}/vclips", {vclip: specific_attributes}
      delete "/api/v0/vclips/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(204)
    end

    it "deletes the specified vclip" do
      post "/api/v0/vstructs/#{specific_attributes[:vstruct_id]}/vclips", {vclip: specific_attributes}

      get "/api/v0/vclips/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(200)

      delete "/api/v0/vclips/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(204)

      get "/api/v0/vclips/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(404)
    end
  end
end
