# Pokémon Gold Expanded

Projeto de expansão de Pokémon Gold sobre o disassembly original
[pret/pokegold](https://github.com/pret/pokegold).

## Plataforma e escopo

- Plataforma-alvo: Game Boy Color.
- Formato de saída: ROM `.gbc`.
- Ferramentas: RGBDS na versão fixada em `.rgbds-version`.
- A compilação de Gold é feita pelo alvo `make gold`.

Este projeto mantém o motor e os limites técnicos do jogo original. Não é uma
conversão para Game Boy Advance.

## Plano de desenvolvimento

As alterações serão implementadas em etapas pequenas, compiláveis e testáveis:

1. **Fundação e compilação:** automatizar a compilação da ROM e guardar o
   artefato de cada build.
2. **Balanceamento e desafios:** revisar equipes de treinadores, progressão
   de níveis, encontros e recompensas sem quebrar eventos existentes.
3. **Conteúdo original:** introduzir novas batalhas, personagens e eventos
   usando os sistemas de mapas e scripts já existentes.
4. **Pokémon adicionais:** avaliar primeiro o espaço de índices, tabelas,
   sprites, paletas, cries, Pokédex, movimentos e compatibilidade de saves.
   A expansão do limite de espécies exige mudanças coordenadas no motor;
   não basta acrescentar entradas às tabelas.
5. **Iniciais e progressão:** implementar a seleção ampliada de iniciais e
   suas evoluções depois que o fluxo de escolha e os dados estiverem prontos.
6. **Validação:** compilar em CI, verificar tamanho/cabeçalho e testar os
   eventos principais em emulador ou hardware compatível.

## Build automatizado

O workflow `.github/workflows/build-expanded.yml` compila
`pokegold.gbc` com RGBDS 1.0.4 e publica a ROM como artefato do GitHub Actions.
O build não inclui uma ROM comercial; o resultado é produzido a partir do
código-fonte deste repositório.

## Estado atual

- [x] Branch de desenvolvimento criada.
- [x] Workflow de compilação GBC adicionado.
- [ ] Primeiro build automatizado validado.
- [ ] Primeiras mudanças jogáveis implementadas.
- [ ] Testes de regressão e de save concluídos.

## Créditos e licenciamento

Este projeto deriva do trabalho da comunidade pret. Consulte os arquivos
LICENSE e README do repositório para créditos e condições aplicáveis.
