require 'spec_helper'

# http://matthewlehner.net/rails-api-testing-guidelines/
describe "/api/v0/vstructs", type: :api do
  include ApiHelper

  def specific_attributes
    { id:                 '4a3bd8d5-6463-428f-bbcc-857ef35414c3',
      label:              'HI2199_123',
      streaming_fname:    'HI2199_123_800k_s.mp4',
      digitization_notes: 'these are some digitization notes...',
      status:             'ready'
    }
  end

  def non_specific_attributes
    { label: 'baz',
      streaming_fname: 'Barbary Anteaters Zapped',
      digitization_notes: "boo",
      status: 'ready'
    }
  end

  def validate_specific_vstruct(json)
    expect(json['id']).to eq("4a3bd8d5-6463-428f-bbcc-857ef35414c3")
    expect(json['streaming_fname']).to eq("HI2199_123_800k_s.mp4")
    expect(json['digitization_notes']).to eq("these are some digitization notes...")
    expect(json['status']).to eq("ready")

    expect(json['created_at']).not_to be_nil
    expect(json['updated_at']).not_to be_nil
  end


  describe "GET /api/v0/vstructs" do
    it "responds with 200 OK status"  do
      get "/api/v0/vstructs"
      expect(last_response.status).to eql(200)
    end

    it "returns all vstructs" do
      FactoryGirl.create_list :vstruct, 10
      get "/api/v0/vstructs"
      expect(last_response.status).to eql(200)
      json = JSON.parse(last_response.body)
      expect(json.length).to eq(10)
    end
  end

  describe "GET /api/v0/vstructs/<id>" do
    it "returns the correct vstruct" do
      FactoryGirl.create :vstruct, specific_attributes
      get "/api/v0/vstructs/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(200)
      json = JSON.parse(last_response.body)
      validate_specific_vstruct(json)
    end

    it "returns a 404 if the vstruct is not found" do
      get "/api/v0/vstructs/00000000-0000-4000-a000-000000000000"
      expect(last_response.status).to eql(404)
    end

    it "returns a 400 if the vstruct id is badly formed" do
      get "/api/v0/vstructs/00000000-0000-4000-a000-00000000000"
      expect(last_response.status).to eql(400)
    end
  end

  describe "POST /api/v0/vstructs" do
    context "with specific :id" do
      it "returns 201" do
        post "/api/v0/vstructs", {vstruct: specific_attributes}
        expect(last_response.status).to eql(201)
      end

      # hostname is www.example.com by default:
      # http://stackoverflow.com/questions/9706772/why-do-rails-tests-run-as-www-example-com
      # http://stackoverflow.com/questions/598933/how-do-i-change-the-default-www-example-com-domain-for-testing-in-rails
      # http://stackoverflow.com/questions/6536503/capybara-with-subdomains-default-host/7050306#7050306
      it "returns the correct Location header" do
        post "/api/v0/vstructs", {vstruct: specific_attributes}
        exp_str = "http://www.example.com/api/v0/vstructs/" +
          specific_attributes[:id]
        expect(last_response.header['Location']).to eql(exp_str)
      end
    end

    context "without a specific :id" do
      it "returns 201" do
        h = non_specific_attributes
        post "/api/v0/vstructs", {vstruct: h}
        expect(last_response.status).to eql(201)
      end

      # hostname is www.example.com by default:
      # http://stackoverflow.com/questions/9706772/why-do-rails-tests-run-as-www-example-com
      # http://stackoverflow.com/questions/598933/how-do-i-change-the-default-www-example-com-domain-for-testing-in-rails
      # http://stackoverflow.com/questions/6536503/capybara-with-subdomains-default-host/7050306#7050306
      it "returns the correct Location header" do
        post "/api/v0/vstructs", {vstruct: non_specific_attributes}
        expect(last_response.header['Location']).to match(/\Ahttp:\/\/www.example.com\/api\/v0\/vstructs\/[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\z/)
      end
    end
  end

  describe "PUT"
  describe "PATCH"

  describe "DELETE /api/v0/vstructs/<:id>" do
    it "returns 204" do
      post "/api/v0/vstructs", {vstruct: specific_attributes}
      delete "/api/v0/vstructs/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(204)
    end

    it "deletes the specified vstruct" do
      post "/api/v0/vstructs", {vstruct: specific_attributes}

      get "/api/v0/vstructs/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(200)

      delete "/api/v0/vstructs/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(204)

      get "/api/v0/vstructs/#{specific_attributes[:id]}"
      expect(last_response.status).to eql(404)
    end
  end
end
