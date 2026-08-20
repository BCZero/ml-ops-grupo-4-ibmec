# Prompt da criacao dos dados do projeto

Use o prompt abaixo em uma ferramenta de IA generativa para reproduzir ou
expandir o dataset sintetico do projeto do Grupo 4.

```text
Gere um dataset sintetico e 100% ficticio em formato CSV para um projeto de
Machine Learning sobre processamento de linguagem natural e classificacao de
ocorrencias policiais.

Contexto: a partir de um relato textual ficticio de ocorrencia, o modelo deve
apoiar a triagem policial sugerindo a natureza penal provavel, a prioridade de
atendimento e o procedimento policial recomendado. O sistema deve ser tratado
apenas como apoio a decisao humana, sem substituir a autoridade policial.

Gere exatamente 40 registros, com as seguintes colunas:

1. id - tipo inteiro - identificador sequencial unico do registro.
2. relato_ocorrencia - tipo texto - narrativa ficticia da ocorrencia.
3. natureza_penal - tipo categorico - uma das categorias: Furto, Roubo,
   Estelionato, Ameaca, Lesao Corporal, Dano ao Patrimonio, Perturbacao do
   Sossego, Trafico de Drogas, Pessoa Desaparecida, Violencia Domestica.
4. bairro_ficticio - tipo categorico nominal - setor ficticio da ocorrencia.
5. turno - tipo categorico ordinal - Madrugada, Manha, Tarde ou Noite.
6. dia_semana - tipo categorico - dia da semana.
7. houve_violencia - tipo booleano - indica uso de violencia ou grave ameaca.
8. envolve_menor - tipo booleano - indica envolvimento de menor de idade.
9. valor_prejuizo_reais - tipo decimal - valor financeiro estimado.
10. gravidade_lesao - tipo categorico ordinal - Nenhuma, Leve, Moderada ou
    Grave.
11. meio_empregado - tipo categorico - meio principal informado no relato.
12. vinculo_partes - tipo categorico - relacao ficticia entre envolvidos.
13. necessita_pericia - tipo booleano - indica necessidade inicial de pericia.
14. prioridade_atendimento - tipo categorico - Baixa, Media ou Alta.
15. procedimento_recomendado - tipo categorico - Termo Circunstanciado de
    Ocorrencia, Inquerito Policial ou Auto de Prisao em Flagrante.
16. tempo_estimado_resolucao_dias - tipo inteiro - estimativa ficticia em dias.

Colunas-alvo principais: natureza_penal, prioridade_atendimento e
procedimento_recomendado.

Regras importantes:
- Todos os dados devem ser ficticios, sem nomes, locais, numeros de documentos
  ou casos reais.
- Distribuir os registros de forma equilibrada entre as 10 categorias de
  natureza_penal, com 4 registros por categoria.
- Incluir propositalmente 2 outliers em valor_prejuizo_reais.
- Incluir variacao suficiente em turno, dia_semana, meio_empregado, vinculo das
  partes e necessidade de pericia.
- Retornar apenas o CSV, com cabecalho na primeira linha, separado por virgulas,
  sem explicacoes adicionais.
```
