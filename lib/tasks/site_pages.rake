namespace :site_pages do

  desc 'load lagou pages'
  task load_pages: :environment do
    141.times do |page_no|
      LoadSiteWorker.perform_async(page_no + 1)
    end
  end

end
