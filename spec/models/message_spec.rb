require 'rails_helper'
	describe Message do
	  context '#create' do
	    it 'is invalid without a body' do
	    	message = build(:message, body:"")
	    	message.valid?
	    	expect(message.errors[:body]).to include("を入力してください")
  	   end
      it "is valid" do
        message = build(:message)
        expect(message).to be_valid
      end
    end
  end

