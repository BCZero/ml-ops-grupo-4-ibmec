# pcdf-tipificacao-procedimentos

Projeto do Grupo 4 para a disciplina MLOps & CI/CD.

## Objetivo

Construir um pipeline de MLOps para apoiar a triagem inicial de ocorrencias
policiais a partir de relatos textuais ficticios. O sistema deve classificar a
natureza penal provavel, estimar a prioridade de atendimento e sugerir o tipo de
procedimento policial cabivel.

O modelo nao substitui a decisao humana da autoridade policial. Ele funciona
como ferramenta de apoio para padronizar a triagem, reduzir retrabalho e
priorizar ocorrencias de maior gravidade.

## Escopo inicial

- Geracao de dataset sintetico e 100% ficticio.
- Organizacao do repositorio no padrao da Aula 01.
- Provisionamento inicial de infraestrutura com Terraform.
- Armazenamento dos dados brutos em uma Storage Account no Azure.
- Preparacao para futuras etapas de pipeline, deploy, Kubernetes e CI/CD.

## Estrutura de diretorios

```text
data/
terraform/
pulumi/
airflow/dags/
kubeflow/
app/
k8s/
github/workflows/
```

## Dataset

O arquivo `data/ocorrencias_sinteticas.csv` contem 40 registros ficticios,
gerados para simular relatos de ocorrencias policiais. As colunas incluem texto
da narrativa, atributos circunstanciais e variaveis-alvo para experimentos de
classificacao.

## Infraestrutura

O arquivo `terraform/main.tf` segue a Parte 11 dos slides da Aula 02:

1. Ler um Resource Group ja existente com `data`.
2. Criar uma Storage Account com `resource`.
3. Criar um container privado para os dados brutos.
4. Executar `terraform init`, `terraform plan` e `terraform apply`.

## Observacoes eticas

Todos os dados sao sinteticos e nao representam pessoas, locais, fatos ou
procedimentos reais. O projeto deve ser tratado como exercicio academico e
demonstracao de MLOps.
