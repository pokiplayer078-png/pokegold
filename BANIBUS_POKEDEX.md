# Pokédex regional de Banibus

A região terá **16 espécies originais**, contando cada estágio evolutivo como uma espécie. Gligar é uma exceção de encontro e não ocupa uma das 16 vagas.

## Linha de Hatme

| Espécie | Tipos | Evolução | Identidade |
|---|---|---|---|
| Hatme | Água/Terrestre | Evolui para Hatmenubis no nível 26 | Peixe pequeno do deserto; extremamente veloz, frágil e pouco ofensivo |
| Hatmenubis | Água/Terrestre | Forma final | Guardião aquático das ruínas; muito veloz e com Ataque Especial elevado |

### Atributos-base propostos

A ordem abaixo segue o formato de Gold: HP, Ataque, Defesa, Velocidade, Ataque Especial e Defesa Especial.

| Espécie | HP | Atq. | Def. | Vel. | Atq. Esp. | Def. Esp. | Total |
|---|---:|---:|---:|---:|---:|---:|---:|
| Hatme | 35 | 25 | 25 | 105 | 20 | 25 | 235 |
| Hatmenubis | 75 | 55 | 60 | 145 | 125 | 70 | 530 |

Hatme será entregue ao jogador no **nível 5**, no primeiro ingresso em Banibus. A entrega deve ser única e persistente. A evolução será por nível, exatamente ao atingir o **nível 26**. Os dois estágios mantêm Água/Terrestre. Hatme terá um conjunto inicial simples e limitado; Hatmenubis aprenderá golpes especiais de Água de alto poder, como Hydro Pump, em níveis avançados. O conjunto definitivo de golpes precisa ser validado contra os movimentos realmente existentes no motor de Gold.

## As 16 espécies originais

Os nomes e conceitos abaixo são a proposta canônica inicial para a fauna regional. Os nomes podem ser ajustados antes da implementação dos sprites, mas a contagem permanece em 16.

| # | Espécie | Tipos | Conceito |
|---:|---|---|---|
| 1 | Hatme | Água/Terrestre | Peixe veloz de poças subterrâneas |
| 2 | Hatmenubis | Água/Terrestre | Guardião veloz das águas antigas |
| 3 | Escarabeu | Inseto | Besouro rola-areia que transporta sementes |
| 4 | Scarabrex | Inseto/Terrestre | Escaravelho colossal de carapaça mineral |
| 5 | Duneko | Terrestre | Pequeno lagarto que se enterra nas dunas |
| 6 | Dunekobra | Terrestre/Veneno | Serpente que caça sob a areia |
| 7 | Oasling | Planta | Broto que armazena água no corpo |
| 8 | Oasisphinx | Planta/Psíquico | Guardião de oásis que cria miragens |
| 9 | Cactusk | Planta | Cacto ambulante de espinhos curtos |
| 10 | Cactitan | Planta/Terrestre | Cacto gigante resistente à seca |
| 11 | Rocadillo | Pedra | Tatu de rocha que escava túneis |
| 12 | Rocadune | Pedra/Terrestre | Escavador blindado dos cânions |
| 13 | Miragato | Noturno | Felino que desaparece em ondas de calor |
| 14 | Mirajaguar | Noturno/Psíquico | Predador de miragens e ilusões |
| 15 | Akarit | Fogo/Pedra | Salamandra que vive nas câmaras quentes da pirâmide |
| 16 | Akarum | Fogo/Pedra | Salamandra ancestral que protege as ruínas |

Gligar pode aparecer em habitats específicos do deserto e do cânion, mas não integra essa contagem de 16 espécies originais.

## Regras de implementação

- Os 16 índices precisam ser integrados de forma consistente em todas as tabelas do jogo: constantes, nomes, dados-base, evoluções e golpes, cries, ícones, sprites frontais/traseiros, paletas, Pokédex, ordem de exibição e demais tabelas indexadas por espécie.
- Não basta adicionar nomes ou estatísticas: cada espécie precisa de sprites 2bpp válidos, dimensões, paleta GBC, cry e entrada Pokédex antes de ser considerada implementada.
- Os encontros de Banibus devem usar exclusivamente essas espécies e Gligar. Não reutilizar tabelas de encontros de Johto/Kanto.
- A entrega de Hatme deve ocorrer somente no primeiro ingresso na região. Se a equipe estiver cheia, enviar ao PC ou usar um fluxo de recebimento seguro; nunca descartar o Pokémon.
- A expansão do limite de espécies deve preservar o valor especial de EGG e os identificadores de espécie de um byte. A implementação requer auditoria do limite atual de 251 espécies, do slot reservado e de todos os usos de NUM_POKEMON antes de alterar índices.
- A linha Hatme/Hatmenubis só será considerada pronta quando a evolução no nível 26, os atributos em batalha, a Pokédex, a captura/recebimento e os saves antigos forem testados no mGBA.


## Espécies integradas nos 14 espaços substituídos

Para abrir espaço sem ampliar os IDs de espécie de um byte nem alterar a estrutura dos saves, os 14 Pokémon de Kanto indisponíveis em Gold por meios normais foram substituídos nos seus próprios índices internos. Os IDs legados continuam como aliases no código para manter scripts antigos compiláveis, mas o nome, tipo, atributos, Pokédex, sprites e evolução agora são os Pokémon de Banibus.

| Pokémon | ID anterior | Tipo | HP | Atq. | Def. | Vel. | Atq. Esp. | Def. Esp. | Evolução |
|---|---:|---|---:|---:|---:|---:|---:|---:|---|
| Escarabeu | 001 | Inseto | 40 | 45 | 45 | 55 | 30 | 35 | Scarabrex Nv. 24 |
| Scarabrex | 002 | Inseto/Terrestre | 75 | 90 | 105 | 75 | 55 | 75 | — |
| Duneko | 003 | Terrestre | 42 | 50 | 35 | 80 | 30 | 35 | Dunekobra Nv. 24 |
| Dunekobra | 004 | Terrestre/Veneno | 70 | 85 | 60 | 115 | 70 | 70 | — |
| Oasling | 005 | Planta | 45 | 35 | 45 | 45 | 55 | 65 | Oasisphinx Nv. 24 |
| Oasisphinx | 006 | Planta/Psíquico | 75 | 65 | 75 | 85 | 115 | 100 | — |
| Cactusk | 007 | Planta | 50 | 55 | 65 | 30 | 45 | 60 | Cactitan Nv. 26 |
| Cactitan | 008 | Planta/Terrestre | 85 | 95 | 110 | 45 | 75 | 95 | — |
| Rocadillo | 009 | Pedra | 55 | 75 | 95 | 35 | 35 | 75 | Rocadune Nv. 24 |
| Rocadune | 144 | Pedra/Terrestre | 90 | 110 | 135 | 40 | 65 | 100 | — |
| Miragato | 145 | Noturno | 55 | 65 | 45 | 105 | 60 | 50 | Mirajaguar Nv. 28 |
| Mirajaguar | 146 | Noturno/Psíquico | 80 | 100 | 75 | 130 | 105 | 75 | — |
| Akarit | 150 | Fogo/Pedra | 45 | 55 | 45 | 70 | 65 | 45 | Akarum Nv. 26 |
| Akarum | 151 | Fogo/Pedra | 85 | 100 | 80 | 100 | 110 | 65 | — |

Hatme e Hatmenubis continuam nos índices 252 e 253 e completam a Pokédex original de 16 espécies de Banibus. Os fósseis de Kanto foram preservados porque a recompensa de primeira vitória na Liga de Banibus entrega um Kabutops Nv. 35, conforme a especificação do projeto.

Os sprites frontais de Gold, Silver e traseiros, paletas normais e brilhantes e pegadas são gerados por `tools/generate_banibus_sprites.py` antes da compilação. Os encontros de Banibus usam as novas espécies e Gligar; a água do Oásis mantém Hatme.
