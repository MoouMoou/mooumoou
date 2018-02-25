class ProjectsController < ApplicationController
  def index
    @projects = Project.recruiting.page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end
end
