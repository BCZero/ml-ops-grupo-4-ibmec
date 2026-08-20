# Entrega 3 - Em Grupo - Grupo 4

Disciplina: MLOps & CI/CD

Projeto: Sistema Integrado de Processamento de Linguagem Natural e Machine
Learning para Tipificacao Criminal e Decisao de Procedimento Policial

## 1. Prompt da criacao dos dados do projeto

O prompt abaixo foi usado como base para gerar o arquivo
`data/ocorrencias_sinteticas.csv`.

```text
Gere um dataset sintetico e 100% ficticio em formato CSV para um projeto de
Machine Learning sobre processamento de linguagem natural e classificacao de
ocorrencias policiais.

Contexto: a partir de um relato textual ficticio de ocorrencia, o modelo deve
apoiar a triagem policial sugerindo a natureza penal provavel, a prioridade de
atendimento e o procedimento policial recomendado. O sistema deve ser tratado
apenas como apoio a decisao humana, sem substituir a autoridade policial.

Gere exatamente 40 registros, com as colunas: id, relato_ocorrencia,
natureza_penal, bairro_ficticio, turno, dia_semana, houve_violencia,
envolve_menor, valor_prejuizo_reais, gravidade_lesao, meio_empregado,
vinculo_partes, necessita_pericia, prioridade_atendimento,
procedimento_recomendado e tempo_estimado_resolucao_dias.

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

## 2. Estrutura criada conforme Aula 01

A estrutura criada segue os passos A2-3 e A2-5 do Manual da Aula 01.

```text
pcdf-tipificacao-procedimentos/
  README.md
  .gitignore
  data/
    ocorrencias_sinteticas.csv
  terraform/
    main.tf
  pulumi/
  airflow/
    dags/
  kubeflow/
  app/
  k8s/
  github/
    workflows/
```

## 3. Evidencias dos passos Terraform - Parte 11 da Aula 02

Arquivo Terraform preparado:

```text
pcdf-tipificacao-procedimentos/terraform/main.tf
```

Recursos previstos:

- Resource Group lido como `data.azurerm_resource_group.rg`.
- Storage Account criada como `azurerm_storage_account.st`.
- Container privado criado como `azurerm_storage_container.raw`.

Comandos da Parte 11:

```powershell
cd pcdf-tipificacao-procedimentos\terraform
terraform init
terraform plan
terraform apply -auto-approve
```

Resultados esperados:

```text
terraform init:
Terraform has been successfully initialized!

terraform plan:
Plan: 2 to add, 0 to change, 0 to destroy.

terraform apply:
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

Conferencia esperada no Portal Azure:

```text
Resource Group: rg-pcdf-demo
Storage Account: sttipcrimeg4mlops
Container: ocorrencias-raw
```

## 4. Evidencias reais pendentes

Neste ambiente local de apoio, os comandos `terraform` e `az` nao estao
instalados. Por isso, os prints/saidas reais devem ser coletados na maquina de
um integrante do grupo que tenha Terraform CLI, Azure CLI e acesso a assinatura
Azure usada na disciplina.

Depois da execucao, substituir esta secao pelas capturas de tela ou saidas reais
do terminal e do Portal Azure.

## 5. GitHub principal do grupo

Selecionar o GitHub de um integrante como repositorio principal, adicionar os
demais membros como colaboradores e adicionar o professor como colaborador.

Link do repositorio:

```text
[SUBSTITUIR PELO LINK DO REPOSITORIO PRINCIPAL]
```
