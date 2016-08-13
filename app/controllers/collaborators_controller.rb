class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new(user_id: params[:user_id], wiki_id: @wiki.id)

    if @collaborator.save
      flash[:notice] = "Collaborator(s) were added successfully."
      redirect_to @wiki
    else
      flash[:alert] = "Collaborator(s) were not added.  Please try again."
      render :show
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator(s) were deleted successfully."
      redirect_to @wiki
    else
      flash[:alert] = "Collaborator(s) were not removed.  Please try again."
      render :show
  end
end
