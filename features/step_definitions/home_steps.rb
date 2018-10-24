require "byebug"


Dado("que esteja no site do Ruby") do
    home.load
end

Quando("clico no link Downloads") do
     home.click_link_downloads
end
