require "byebug"


Então("a do navegador url deve ser {string}") do |url|
  expect(page.current_url).to eq(url)
end

E("a página deve conter o texto") do |text|
  expect(page).to have_content(text)
end

E("o titulo da página deve ser {string}") do |title|
  expect(page.title).to have_content(title)

end
