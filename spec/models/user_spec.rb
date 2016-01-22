require 'spec_helper'
require 'shoulda/matchers'

describe User do
	let(:valid_attributes) {
		{
			first_name: "Tori",
			last_name: "Wood",
			email: "vaw08@my.fsu.edu"
		}
	}



  context "validations" do
  	let(:user) {User.new(valid_attributes)}

  	before do
  		User.create(valid_attributes)
  	end

  	it "requires an email" do
  		expect(user).to validate_presence_of(:email)
  	end

  	it "requires a unique email" do
  		expect(user).to validate_uniqueness_of(:email)
  	end

  	it "requires a unique email (case insensitive)" do
  		user.email = "TORI@GMAIL.COM"
  		expect(user).to validate_uniqueness_of(:email)
  	end
  end

  describe "#downcase_email" do
  	it "makes the email attribute lower case" do
  		user = User.new(valid_attributes.merge(email: "TORI@GMAIL.COM"))
			expect { user.downcase_email }.to change{ user.email }.
			from("TORI@GMAIL.COM").
			to("tori@gmail.com")
  	end

  	it "downcases an email before saving" do
  		user = User.new(valid_attributes)
  		user.email = "TORI@GMAIL.COM"
  		expect(user.save).to be true
  		expect(user.email).to eq("tori@gmail.com")
  	end
  end
end
