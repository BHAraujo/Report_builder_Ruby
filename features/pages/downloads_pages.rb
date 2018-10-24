class Downloads < SitePrism::Page
      set_url " "

      element :link_licenca_ruby, "#content > p.summary > a"


      def click_link_licenca_ruby
          link_licenca_ruby.click
      end
end
