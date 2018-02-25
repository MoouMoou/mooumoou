class LoadSiteWorker
  include Sidekiq::Worker

  def perform(page_no = nil)
    if page_no.nil?
      doc = Nokogiri::HTML(open(SiteLoader::PROJECT_LIST_URL))
      page_count = doc.content.match(/global.pageCount = "(\d+)"/)[1].to_i
      page_size = doc.content.match(/global.pageSize = "(\d+)"/)[1].to_i
      total_page = page_count / page_size + 1

      total_page.times do |page_no|
        LoadSiteWorker.perform_async(page_no)
      end
    else
      SiteLoader.parse_projects(page_no)
    end
  end
end
