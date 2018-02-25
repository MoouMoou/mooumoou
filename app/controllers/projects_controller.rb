class ProjectsController < ApplicationController
  def index
    @projects = Project.recruiting.order(posted_at: :desc).page(params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end
end
