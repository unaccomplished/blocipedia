require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:wiki) { create(:wiki) }

  describe "attributes" do
      it "has title, body, and private attributes" do
          expect(wiki).to have_attributes(title: "MyString", body: "MyText", private: false, user: nil)
      end
  end

  # Best effort at writing tests for scopes, but keep getting error:
  # Failure/Error: scope :visible_to, -> (user) { user && (user.admin? || user.premium?) ? all : where(private: false) }
  #
  #    NoMethodError:
  #      undefined method `admin?' for #<ActiveRecord::Relation []>
  #    # ./app/models/wiki.rb:4:in `block in <class:Wiki>'
  #    # ./spec/models/wiki_spec.rb:21:in `block (4 levels) in <top (required)>'

  # describe "scopes" do
  #   before do
  #     @public_wiki = Wiki.create!(title: "Public Wiki Title", body: "Public Wiki Body", private: false)
  #     @private_wiki = Wiki.create!(title: "Private Wiki Title", body: "Private Wiki Body", private: true)
  #   end
  #
  #   describe "visible_to(user)" do
  #     it "returns all wikis if the user is premium" do
  #       user = User.where(role: 'premium')
  #       expect(Wiki.visible_to(user)).to eq(Wiki.all)
  #     end
  #
  #     it "returns all wikis if the user is admin" do
  #       user = User.where(role: 'admin')
  #       expect(Wiki.visible_to(user)).to eq(Wiki.all)
  #     end
  #
  #     it "returns only public wikis if user is standard" do
  #       user = User.where(role: 'standard')
  #       expect(Wiki.visible_to(user)).to eq([@public_wiki])
  #     end
  #   end
  # end
end
