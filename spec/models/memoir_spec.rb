require 'spec_helper'

describe Memoir do

	let(:user) { FactoryGirl.create(:user) }
	before { @memoir = user.memoirs.build(content: "This is a testing memoir content") }

  	subject { @memoir }

  	it { should respond_to(:content) }
  	it { should respond_to(:user_id) }
  	it { should respond_to(:user) }
  	its(:user) { should eq user }

  	it { should be_valid }

  	describe "when user_id is not present" do
    	before { @memoir.user_id = nil }
    	it { should_not be_valid }
  	end

  	describe "with blank content" do
    	before { @memoir.content = " " }
    	it { should_not be_valid }
  	end

end