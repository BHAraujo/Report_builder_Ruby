#language: pt

Funcionalidade: Navegar
      Eu como usuario quero navegar no site do Ruby

      Contexto: Preparar o ambiente
            Dado que esteja no site do Ruby

      @solo1
      Cenário: Acessar a página de Downloads
            Quando clico no link Downloads
            Então a do navegador url deve ser "https://www.ruby-lang.org/pt/downloads/"

      Cenário: Acessar a página de Downloads - (Quebrar Teste)
            Quando clico no link Downloads
            Então a do navegador url deve ser "https://www.ruby.com.br"


      @solo
      Cenário: Acessar a página de licença do Ruby
            Quando clico no link Downloads
            E o titulo da página deve ser "Baixar o Ruby"
            E no clico no link Licença do Ruby
            Então a página deve conter o texto
            """
            Ruby is copyrighted free software by Yukihiro Matsumoto <matz@netlab.jp>
            """

      @solo
      Cenário: Acessar a página de licença do Ruby - (Quebrar Teste)
            Quando clico no link Downloads
            E o titulo da página deve ser "Baixar o Ruby"
            E no clico no link Licença do Ruby
            Então a página deve conter o texto
            """
            O BIRL (Bambam's "It's show time" Recursive Language) é a linguagem de programação mais
            treze já inventada
            """
