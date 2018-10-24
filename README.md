Configuração do relatório Report Builder

1 - Função que define a configuração do relatório a ser gerado, chamar função no arquivo hooks.rb

  After do |feature|
      gerar_relatorio(feature)
  end

  helpers.rb
  def gerar_relatorio(feature)
      ReportBuilder.configure do |config|
        time = Time.now.strftime('%d/%m/%Y %H:%M').gsub(":", "-")
        config.input_path = "#{edit_absolute_path}/reports/RelatorioHtml/report_builder_json/report_builder2.json"
        config.report_path = "#{edit_absolute_path}/reports/RelatorioHtml/#{feature.name.gsub(" ", "_")}"
        config.report_types = [:html]
        config.report_tabs = %w[Overview Features Scenarios Errors]
        config.report_title = 'Report Builder'
        config.compress_images = false
        config.include_images = true
        config.color = 'blue'
        config.additional_info = {"Projeto" => "Report Builder", "Navegador" => get_name_browser,
                                  "Data Criação" => time.gsub("-", ":")}
      end
      ReportBuilder.build_report
    end
___________________________________________________________________________________________________
2 - Colocar o arquivo report_builder.json na pasta support ou em outra pasta de sua preferência.
      Passar o caminho do report_builder.json que irar gerar o html
        - config.input_path = File.dirname(__FILE__) + "/report_builder.json"
      Caminho de irá salvar o relatório em html  
            config.report_path = "<caminho_para_salvar_o_html>"

command line: cucumber --format json -o reports/<nome_do_arquivo.json>  
Obs: o <nome_do_arquivo> deve ser igual o configurado na config.input_path          

Pronto agora é só acessar a pasta onde o Report Builder salvo o html e ser feliz =D.
___________________________________________________________________________________________________

Desenvolvedor: Bruno Henrique Araujo
Email: lbruno.henrique.araujo@gmail.com
GitHub: https://github.com/BHAraujo
