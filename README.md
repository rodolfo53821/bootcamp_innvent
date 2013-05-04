![pictureGallery](http://www.innvent.com.br/images/LogoInnvent.PNG "Innvent")

# Innvent - Bootcamp

#Projeto desenvolvido por Rodolfo da Costa e Acaz Souza.

Projeto 2D

As questões 1,3,4 foram implementadas

Questao 1
Utilizamos o scaffold para gerar o colaborador
Modificamos o esquema para atender as requisições necessárias, inclusive a troca de responsavel por colaborador

Questao 2
Tivemos um pouco de dificuldade para soluciona-la, ao adicionar um modal com o form que tinhamos, então visto o tempo
a mesma foi deixada de lado.

Questao 3
Utilizamos um link para finalizar a tarefa e um controlador que atualiza a mesma no banco
A exposicao das tarefas finalizadas foi feito por um teste simples para averiviguar se a mesma esta terminada e assim tachar a descricao e tornar 
a opção finalizar como uma label simples

Questão 4
Criamos uma regra simples assim como foi feito para validar o texto com letra inicial maiuscula, para que o mesmo fosse
valido segundo os criterios estabelicidos


Validação dos testes: Algumas das falhas encontradas pelo o teste foram corrigidas, algumas como o caso de validação da data inicial nao ser inferior 
ao dia atual foi feita mas requer verificações

Projeto 2do metrics

Realizamos a tarefa em javascript e jquery
Para alimentar as requisições realizadas pelo nosso projeto, dentro do projeto 2do foi criado rotas que retornam 
todos os colaboradores, tarefas e projetos (cada uma em seu controlador especifico), e apos isto, são processados pelo 2do metrics

Sobre o javascript, fizemos uma solução que envolve encapsulação com os métodos privados e expus apenas os métodos que resolve o problema pedido. Mas tivemos um
problema em relação ao contexto que o Ajax pra retornar o Json criava, a espera pelos callbacks nos atrapalhou um pouco. Conseguimos resolver, fizemos o Exibir tempo total gasto em tarefas por projeto,  mas faltou tratarmos as datas com o javascript o que nos causou problemas.

Colocamos o código dentro do próprio projeto TOdo = Assets/JavaScript/ToDoMetrics.js.

#Obrigado
