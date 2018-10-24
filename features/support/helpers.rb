require "byebug"


module Helpers

    def get_name_browser
      if $BROWSER.nil?
        get_name_browser = "Firefox"
      else
        get_name_browser = $BROWSER.capitalize
    end
  end


  def take_screenshot(name_scenario, status, browser)
      data = Time.now.to_s.gsub(":", " ")
      save_path = "reports/Screenshots/#{browser}/#{status}/#{name_scenario}_#{data}.png"
      page.save_screenshot(save_path)
  end

  def edit_absolute_path
      path = File.dirname(__FILE__)
      remove_path = path.size - 18
      path_convert = path[0..remove_path]
  end


  def gerar_relatorio(feature)
      ReportBuilder.configure do |config|
        time = Time.now.strftime('%d/%m/%Y %H:%M').gsub(":", "-")
        config.input_path = "#{edit_absolute_path}/reports/RelatorioHtml/report_builder_json/report_builder.json"
        config.report_path = "#{edit_absolute_path}/reports/RelatorioHtml/#{feature.name.gsub(" ", "_")}"
        config.report_types = [:html]
        config.report_tabs = %w[Overview Features Scenarios Errors]
        config.report_title = 'Report Builder Ruby '
        config.compress_images = false
        config.include_images = true
        config.color = 'blue'
        config.additional_info = {"Projeto" => "Report Builder", "Navegador" => get_name_browser,
                                  "Data Criação" => time.gsub("-", ":")}
      end
      ReportBuilder.build_report
    end
end
