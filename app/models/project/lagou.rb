class Project::Lagou < Project

  def status_parse=(status)
    self.status = case status
                  when '招募中'
                    :recruiting
                  when '执行中'
                    :working
                  when '已完成'
                    :finished
                  end
  end

end
