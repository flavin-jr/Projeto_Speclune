Feature: Comentar em posts
    As a Usuário que possui uma conta no software
    I want to Comentar em posts
    so that Eu possa escrever comentários em posts já criados

Scenario: Comentar em um post sem atingir o limite de caracteres
    Given Estou logado com o usuário "Alanzoka"
        And estou na página "publicações"
        And vejo uma "publicação"
        And vejo a opção "comentar"
    When Eu seleciono a opção "comentar"
        And digito o texto "Jogo ruim" menor ou igual a "20" caracteres no campo "Adicione um comentário"
        And seleciono a opção "enviar"
    Then Eu estou na página "publicações"
        And vejo a "publicação" com o meu comentário "Jogo ruim" logo abaixo

Scenario: Comentar em um post ultrapassando o limite de caracteres
    Given Estou logado com o usuário "Alanzoka"
        And estou na página "publicações"
        And vejo uma "publicação"
        And vejo a opção "comentar"
    When Eu seleciono a opção "comentar"
        And digito o texto "Um dos melhores jogos já feitos" maior que "20" caracteres no campo "Adicione um comentário"
        And seleciono a opção "enviar"
    Then Eu estou na página "publicações" 
        And eu vejo a publicação com o meu comentário “Um dos mel”, mostrando apenas os primeiros “10” caracteres
        And vejo uma opção "ver mais" ao lado do meu comentário "Um dos mel"

Scenario: Fazendo um comentário vazio
    Given Estou logado com o usuário "Alanzoka"
        And estou na página "publicações"
        And vejo uma "publicação"
        And vejo a opção "comentar"
    When Eu seleciono a opção "comentar"
        And deixo o campo "Adicione um comentário" vazio
        And eu tento selecionar a opção "enviar"
    Then A opção "enviar" está indisponível
        And ainda vejo o campo "Adicione um comentário" vazio

Scenario: Acessar uma página enquanto comenta em um post
    Given Estou logado com o usuário "Alanzoka"
        And estou na página "publicações"
        And vejo uma "publicação"
        And vejo a opção "comentar"
    When Eu seleciono a opção "comentar"
        And digito o texto "Eu gost" no campo "Adicione um comentário"
        And seleciono a página "perfil"
    Then Eu estou na página "perfil"
        And nada foi comentado na(o) "publicação"
	And vejo uma mensagem "Rascunho apagado" na tela

Scenario: Adicionar uma imagem ao comentar em um post
    Given Estou logado com o usuário "Alanzoka"
        And estou na página "publicações"
        And vejo uma "publicação"
        And vejo a opção "comentar"
    When Eu seleciono a opção "comentar"
        And seleciono a opção "mídia" abaixo do campo "Adicione um comentário"
    Then Eu ainda estou na "publicação"
        And vejo opções de "imagens" que estão armazenadas(os) no meu dispositivo

Scenario: Adicionar um gif ao comentar em um post
    Given Estou logado com o usuário "Alanzoka"
        And estou na página "publicações"
        And vejo uma "publicação"
        And vejo a opção "comentar"
    When Eu seleciono a opção "comentar"
        And seleciono a opção "gif" abaixo do campo "Adicione um comentário"
    Then Eu estou na "publicação"
	And vejo opções de "gif" armazenados no(a) "sistema"
	And vejo a opção "fechar" 
