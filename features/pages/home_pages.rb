class Home < SitePrism::Page

      set_url " "

      element :link_downloads, "#header_content > div.site-links > a:nth-child(2)"


      def click_link_downloads
        link_downloads.click
      end


end
