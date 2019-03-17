class ProgramsController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    if params[:program].present?
      @programs = []
      p "@@@@@@params@@@@@@"
      p @area = params[:program][:area]
      p @service = params[:program][:service]
      p @genre = params[:program][:genre]
      p @date = (params[:program][:date])

      # 全パラメータの入力を確認する方法が不明。。とりあえずareaがあればAPIを叩く・・
      if @area.present?
        client = NHKProgram.new
        results = client.list(@area, @service, @date)
        p "##########api_result_loop_start##########"
        results.list[@service].each do |result|
          p "$$$$result_start$$$$$"
          # ["id", "event_id", "start_time", "end_time", "area", "service", "title", "subtitle", "genres"]
          p program_id = result.event_id
          p start_time = result.start_time
          p end_time = result.end_time
          ["id", "name", "logo_s", "logo_m", "logo_l"]
          p service = result.service.name
          p title = result.title
          hash =     {
                        program_id: program_id,
                        start_time: start_time,
                        end_time: end_time,
                        service: service,
                        title: title
                      }
          program = hash
          @programs << program
        end
      end
    end
    render :new
  end
  
  def show
    @program_detail = Program.find_by(id: params[:id])
    @id = params[:id]
  end
  
  private

  def read(result)
    program_id = result['program_id']
    start_time = result['start_time']
    end_time = result['end_time']
    service = result['service']
    title = result['title']

    {
      program_id: program_id,
      start_time: start_time,
      end_time: end_time,
      service: service,
      title: title
    }
  end
  
end
