class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(user_id: params[:user_id])

    if @collaborator.save
      flash[:notice] = "Collaborator was added successfully."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "Collaborator was not added.  Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed successfully."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:alert] = "Collaborator was not removed.  Please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
