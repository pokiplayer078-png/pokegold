# Expansão de início e mini-região Banibus

Este documento define a próxima grande etapa de conteúdo. É uma especificação de implementação, não uma afirmação de que os mapas ou Pokémon já estejam dentro da ROM.

## Direção geral

- Banibus é uma mini-região opcional, acessível depois de um marco inicial da aventura (proposta: receber a Pokédex e concluir a primeira entrega de Elm).
- Inspiração visual: Saara — dunas extensas, cânions, oásis, ruínas antigas e pirâmides. A ambientação será original e não copiará monumentos ou personagens reais.
- A região terá quatro ginásios, quatro insígnias e uma pequena sequência de história ligada a uma expedição arqueológica.
- A fauna selvagem de Banibus será exclusiva da região: espécies novas criadas para o projeto e Gligar. Não usar encontros comuns de Johto/Kanto nos mapas selvagens de Banibus.
- Gligar será uma exceção deliberada entre espécies já existentes; sua presença deverá ser garantida em pelo menos um habitat desértico e em uma área de cânion.

## Estrutura proposta de Banibus

1. **Oásis de Miragem** — vila de entrada, centro Pokémon, loja, poço antigo e acesso às dunas.
2. **Dunas do Sol Partido** — primeira rota desértica, tempestades de areia como obstáculo visual e ninhos de espécies escavadoras.
3. **Pirâmide de Akar** — ruína explorável com salas, enigmas de placas e um guardião de pedra.
4. **Cânion das Presas** — trilha estreita, pontes e habitat de Gligar.
5. **Cidade de Safira** — maior assentamento, mercado, museu e quarto ginásio.
6. **Templo do Zênite** — área final da mini-região e clímax da história.

## Quatro ginásios

| Ordem | Cidade | Tema | Identidade do desafio |
|---|---|---|---|
| 1 | Oásis de Miragem | Terra | percurso de escavação e plataformas |
| 2 | Cidade de Safira | Pedra | salas que giram e passagens secretas |
| 3 | Acampamento do Cânion | Voador | passarelas, correntes de vento e pontes |
| 4 | Cidade do Zênite | Psíquico | espelhos, símbolos e salas ilusórias |

Os líderes, equipes, níveis, insígnias e TMs serão balanceados para o momento da campanha em que Banibus for desbloqueada. Os quatro ginásios precisam ser eventos reais com scripts, treinadores e recompensas, não apenas placas ou diálogos.

## Pokédex exclusiva de Banibus

A regra de encontros da região será:

- Somente Pokémon originais novos criados para esta expansão.
- Gligar pode aparecer como a única espécie preexistente permitida.
- Nenhum encontro selvagem padrão de Johto/Kanto deve vazar para as tabelas de Banibus.
- As espécies novas terão nomes, tipos, evoluções, atributos, golpes aprendidos, cries, sprites, ícones, paletas e entradas de Pokédex próprios.
- A lista final de espécies será definida junto com os limites de índices e o espaço de ROM, antes de alterar tabelas centrais.

Conceitos iniciais de fauna (nomes de trabalho, sujeitos a revisão): um pequeno escorpião de areia, um lagarto de dunas, um besouro de cristal, uma serpente de ruínas, um felino de oásis e um guardião fóssil. Não são ainda espécies codificadas no jogo.

## Mais atividades no começo de Johto

A abertura deverá oferecer mais coisas opcionais sem bloquear o caminho principal:

- **New Bark:** conversa opcional com um pesquisador assistente, pequena tarefa de observação e uma recompensa útil de início.
- **Laboratório de Elm:** livros e equipamentos interativos com dicas de tipos, captura, estados e itens segurados; uma atividade curta após escolher o inicial.
- **Rota 29:** encontros com treinadores opcionais e uma tarefa de coleta/observação que ensine a consultar a Pokédex.
- **Cherrygrove:** pedido de entrega do guia local, uma batalha amistosa opcional e uma pequena recompensa por explorar a cidade.
- **Rotas 30–31:** mais itens escondidos, atalhos e treinadores opcionais para dar motivos para explorar antes de Violet.
- **Retorno a locais anteriores:** alguns NPCs e recompensas mudam após receber a Pokédex, vencer o primeiro ginásio ou concluir a entrega do ovo.

Essas atividades não devem entregar Pokémon de Banibus antes do acesso à região, para manter sua fauna exclusiva.

## Plano técnico e critérios de conclusão

1. Prototipar um mapa de Banibus reutilizando os formatos de mapa e tilesets compatíveis com o motor GBC.
2. Integrar o novo grupo de mapas em todas as tabelas dependentes: constantes, cabeçalhos, atributos, blocos, scripts, conexões, landmarks, mapas de voo e dados de encontros.
3. Implementar os quatro ginásios e testar entradas, saídas, cenas, treinadores, insígnias e progressão.
4. Fazer a expansão de espécies de forma coordenada: índices, estatísticas, tipos, evoluções, movimentos, sprites, ícones, paletas, cries, Pokédex, encontros, treinadores e compatibilidade de saves.
5. Criar e inserir os mapas e gráficos de deserto, oásis, cânion e pirâmide.
6. Implementar os encontros exclusivos e validar que apenas as espécies novas e Gligar apareçam em Banibus.
7. Expandir o início de Johto com scripts e recompensas opcionais, preservando o fluxo original de Elm, o rival e a entrega do ovo.
8. Compilar a ROM em CI e fazer testes de regressão em emulador, incluindo saves antigos e novos.

## Limites importantes

Pokémon Gold usa um motor de Game Boy Color e não possui habilidades, naturezas ou os sistemas modernos de Pokémon. Novas espécies e uma região inteira exigem alterações estruturais e testes de ROM; não é seguro simular isso apenas com nomes ou entradas incompletas. A implementação será dividida em entregas pequenas que compilam individualmente.
