class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :delete]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      redirect_to @project, notice: "Hey bbk! Your project has been saved"
    else
      render 'new', notice: "Sorry bbk! I could not create the project"
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @post, notice: "Hurray! Your project has been updated."
    else
      render 'edit', notice: "Oh no Bbk! I could not update the project"
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
