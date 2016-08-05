# require 'rails_helper'
#
# RSpec.describe WikiPolicy do
#   let(:wiki) { create(:wiki) }
#
#   permissions :update?, :edit? do
#     it "grants access to user to update if user is present" do
#       expect(:wiki).to permit(User, Wiki.update)
#     end
#   end
# end
