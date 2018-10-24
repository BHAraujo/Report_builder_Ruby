require "report_builder"


Before do
  get_name_browser
end

After do |scenario|
  if scenario.failed?
    take_screenshot(scenario.name.gsub(" ", "_"), "Falhou", get_name_browser)
  else
    take_screenshot(scenario.name.gsub(" ", "_"), "Passou", get_name_browser)
  end

end

After do |feature|
  gerar_relatorio(feature)
end
