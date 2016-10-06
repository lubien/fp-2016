{-
  Universidade Federal do Pará
  Topicos Especiais de Computação - Programação Funcional
  Professor Adagenor Ribeiro
  Aluno João de Deus Ferreira Filho [201504940020]
-}

{-
  Uma das características mais conhecidas da programação funcional é a sua
  capacidade de abstrair formalismos matématicos com fluência.
  Como resultado, a presença de loops neste paradigma de programação é
  feita através da técnica de recursão.

  Todavia, mesmo que uma especificação matemática seja bem clara, não é
  optimizada para computações. Utilizar recursão a esmo pode se demonstrar
  uma falha crítica na performance do seu sistema uma vez que você falha
  em acumular devidamente valores.
-}

fact 1 = 1
fact n = n * (fact (n - 1))

{-
  Na implementação acima, utilizando a especificação matemática, foi
  implementada a definição de um valor fatorial recursivamente.
  A primeira vista, não há problemas, de um ponto de vista matemático, mas
  quando trabalhamos com um computador devemos nos atentar ao fato de que
  a execução desta função se dá da seguinte forma:

  fact 3
  3 * (fact 2)
  3 * 2 * (fact 1)
  3 * 2 * 1
  3 * 2
  6

  Durante as chamadas recursivas, a função teve que manter uma pilha
  de execução para, uma vez que finalizada a recursão, executar os demais
  formalismos. Esta característica é prejudicial uma vez que há a necessidade
  de calcular valores cada vez mais elevados, necessitando de muito mais
  espaço na memória, além de necessitar de mais passos para concluir a computação.

  Como solução, a programação invariante entra. Trata-se do paradigma de alterar
  o corpo da função sem variar o resultado. A função acima poderia ser reescrita
  como:
-}

fact' 1 acc = acc
fact' n acc = fact' (n - 1) (n * acc)

{-
  A mudança está no fato de que, agora, os valores que anteriormente se acumulariam
  em uma pilha para ser executados posteriormente, são avaliado ansiosamente e salvos
  em um segundo parâmetro chamado de acumulador, que é nosso invariante.

  Seja a execução:

  fact' 3 1 -- inicia-se com um acumulador 1
  fact' 2 3
  fact' 1 6
  6

  O grande diferencial está no fato de que a recursão retornava apenas uma nova
  chamada à própria função ou então um valor, nunca criando uma pilha de expressões.
  Enquanto isso, nosso invariante `acc` acumulava o valor computado mantendo o
  resultado da expressão sempre o mesmo. Nota-se:

  fact' 3 1 -- lê-se: o resultado é o fatorial de 3 multiplicado por 1
  fact' 2 3 -- lê-se: o resultado é o fatorial de 2 multiplicado por 3
  fact' 1 6 -- lê-se: o resultado é o fatorial de 1 multiplicado por 6

  Essencialmente, todos os passos da execução tem o mesmo resultado, daí a
  ideia de programação invariante. Este conceito baseia-se na Teoria dos
  Vasos Comunicantes. Não importa como você distribua uma quantidade de água
  entre dois vasos unidos, o valor sempre é o mesmo.

  Outra nomenclatura importante é referente à função apenas retornar a si mesmo,
  que é chamado Recursão de Chamada de Cauda, isto devido ao fato de a recursão
  ser feita no final da função (cauda). Uma função que utiliza esta técnica, em
  conjunto com um invariante, é dita como Loop Verdadeiro.

  Por fim, é um caso constrangedor a API da função fatorial requerer que o
  programador defina um acumuludador inicial a toda utilização, posto que
  este sempre deverá ser 1. Como solução, basta-se utilizar uma closure.

  Segue a implementação:
-}

fact'' n =
  let
    fact_aux 1 acc = acc
    fact_aux n acc = fact_aux (n - 1) (n * acc)
  in
    fact_aux n 1

{-
  Nesta implementação final, a API pública da função fatorial tem como assinatura
  receber apenas um parâmetro. Dentro de si, ela define uma função auxiliar privada
  recursiva por chamada de cauda utilizando um invariante `fact_aux` e a retorna com
  o devido acumulador inicial que é 1.
-}

