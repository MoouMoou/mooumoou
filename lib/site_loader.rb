require 'nokogiri'
require 'open-uri'

module SiteLoader

  PROJECT_LIST_URL = 'https://pro.lagou.com/project/'

  class << self
    def parse_projects(page_no)
      doc = Nokogiri::HTML(open("#{PROJECT_LIST_URL}#{page_no}"))

      doc.css('#project_list li').each do |project|
        title = project.css('h3').first.content
        origin_url = project.css('a').first['href']
        project_id = origin_url.match(/\/(\d+)\.html$/)[1]
        status = project.css('.status span').first.content

        project = Project.find_by(origin_id: project_id) || Project::Lagou.new

        project.origin_id = project_id
        project.title = title
        project.origin_url = origin_url
        project.status_parse = status
        project.save
      end
    end

    def parse_project(id)
      project = Project.find(id)

      doc = Nokogiri::HTML(open(project.origin_url))

      body = doc.css('.project_txt pre').first.content
      posted_at = Time.parse(doc.css('#project_detail > div.project_info.fl > ul:nth-child(3) > li:nth-child(1) > span:nth-child(3)').first.content)

      project.update(body: body, posted_at: posted_at)
    end
  end

end
