require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { create(:wiki) }
  
  describe "attributes" do
      it "has title, body, and private attributes" do
          expect(wiki).to have_attributes(title: "MyString", body: "MyText", private: false, user: nil)
      end
  end
end
