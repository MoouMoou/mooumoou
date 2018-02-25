class ProjectWorker
  include Sidekiq::Worker

  def perform(id)
    SiteLoader.parse_project(id)
  end
end
