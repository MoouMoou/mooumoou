class Project < ApplicationRecord
  enum status: [:recruiting, :working, :finished]

  after_create :load_project_detail

  private
    def load_project_detail
      ProjectWorker.perform_async(self.id)
    end
end
