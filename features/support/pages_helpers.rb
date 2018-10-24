Dir[File.join(File.dirname(__FILE__), "/pages/*_pages.rb")].each{ |file| require file}


module PageObjects

    def home
      @home ||= Home.new
    end

    def documentacao
        @documentacao ||= Documentacao.new
    end

    def downloads
      @downloads ||= Downloads.new
    end
    
end
