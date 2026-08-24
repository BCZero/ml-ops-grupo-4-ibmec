# Entrega 3 - Em Grupo - Grupo 4

Disciplina: MLOps & CI/CD  
Atividade: Entrega 3 - Em Grupo - 15 pontos  
Grupo: Grupo 4
Integrantes: Bruno Cesar Sampaio Ribeiro de Assis, Daniel Barrozo Lima, Micael Trindade, Pedro Henrique Casimiro, Pedro Guilherme Feitoza Melo
Repositorio GitHub principal: https://github.com/BCZero/ml-ops-grupo-4-ibmec

## 1. Projeto

Nome do projeto:

```text
Sistema Integrado de Processamento de Linguagem Natural e Machine Learning
para Tipificacao Criminal e Decisao de Procedimento Policial
```

O projeto tem como objetivo apoiar a triagem inicial de ocorrencias policiais a
partir de relatos textuais ficticios. O modelo deve sugerir a natureza penal
provavel, a prioridade de atendimento e o procedimento policial recomendado.

Todos os dados usados no projeto sao sinteticos e 100% ficticios. O sistema e
tratado apenas como apoio academico e demonstrativo de MLOps, sem substituir
decisao humana ou autoridade policial.

## 2. Prompt da criacao dos dados do projeto

Prompt usado como base para gerar o arquivo
`data/ocorrencias_sinteticas.csv`:

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

## 3. Estrutura criada conforme Aula 01

A estrutura criada segue os passos A2-3 e A2-5 do Manual da Aula 01.

```text
pcdf-tipificacao-procedimentos/
  README.md
  .gitignore
  data/
    ocorrencias_sinteticas.csv
  terraform/
    main.tf
    .terraform.lock.hcl
  pulumi/
  airflow/
    dags/
  kubeflow/
  app/
  k8s/
  github/
    workflows/
```

Arquivo de dados gerado:

```text
pcdf-tipificacao-procedimentos/data/ocorrencias_sinteticas.csv
```

Arquivo Terraform principal:

```text
pcdf-tipificacao-procedimentos/terraform/main.tf
```

## 4. Infraestrutura Terraform - Parte 11 da Aula 02

A Parte 11 da Aula 02 solicita o provisionamento de infraestrutura basica no
Azure com Terraform. A configuracao implementada:

- usa o provider `hashicorp/azurerm`;
- le o Resource Group existente com `data.azurerm_resource_group.rg`;
- cria uma Storage Account;
- cria um container privado para os dados brutos;
- executa o ciclo `terraform init`, `terraform plan` e `terraform apply`.

Recursos definidos no Terraform:

```text
data.azurerm_resource_group.rg
azurerm_storage_account.st
azurerm_storage_container.raw
```

## 5. Ambiente de execucao

A execucao foi realizada no Azure Cloud Shell usando a assinatura estudantil
`Azure for Students`.

Comando:

```bash
az account list -o table
```

Evidencia:

```text
Name                CloudName    SubscriptionId                        TenantId                              State    IsDefault
------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
Azure for Students  AzureCloud   e771023a-9b4a-4814-a772-5e8531303957  da49a844-e2e3-40af-86a6-c3819d704f49  Enabled  True
```

Versao do Terraform:

```text
Terraform v1.15.8
on linux_amd64
```

## 6. Clone do repositorio no Azure Cloud Shell

Comandos:

```bash
git clone https://github.com/BCZero/ml-ops-grupo-4-ibmec.git
cd ml-ops-grupo-4-ibmec/Entrega_3_Grupo4/pcdf-tipificacao-procedimentos/terraform
ls -la
```

Evidencia:

```text
Cloning into 'ml-ops-grupo-4-ibmec'...
Receiving objects: 100% (47/47), 22.00 MiB | 3.87 MiB/s, done.
Resolving deltas: 100% (2/2), done.

total 12
drwxr-xr-x  2 bruno bruno 4096 Aug 24 19:18 .
drwxr-xr-x 10 bruno bruno 4096 Aug 24 19:18 ..
-rw-r--r--  1 bruno bruno 1094 Aug 24 19:18 main.tf
```

## 7. Criacao do Resource Group

Comando:

```bash
az group create --name rg-pcdf-demo --location brazilsouth
```

Evidencia:

```json
{
  "id": "/subscriptions/e771023a-9b4a-4814-a772-5e8531303957/resourceGroups/rg-pcdf-demo",
  "location": "brazilsouth",
  "name": "rg-pcdf-demo",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "type": "Microsoft.Resources/resourceGroups"
}
```

## 8. Terraform init

Comando:

```bash
terraform init
```

Evidencia:

```text
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 3.0"...
- Installing hashicorp/azurerm v3.117.1...
- Installed hashicorp/azurerm v3.117.1 (signed by HashiCorp)

Terraform has been successfully initialized!
```

## 9. Terraform fmt e validate

Comandos:

```bash
terraform fmt
terraform validate
```

Evidencia:

```text
Success! The configuration is valid.
```

## 10. Terraform plan

Comando:

```bash
terraform plan
```

Leitura do Resource Group:

```text
data.azurerm_resource_group.rg: Reading...
data.azurerm_resource_group.rg: Read complete after 0s [id=/subscriptions/e771023a-9b4a-4814-a772-5e8531303957/resourceGroups/rg-pcdf-demo]
```

Recursos previstos para criacao:

```text
# azurerm_storage_account.st will be created
# azurerm_storage_container.raw will be created
```

Resumo do plano:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

Outputs previstos:

```text
Changes to Outputs:
  + container_name       = "ocorrencias-raw"
  + resource_group_name  = "rg-pcdf-demo"
  + storage_account_name = "sttipcrimeg4mlops"
```

## 11. Terraform apply

Comando:

```bash
terraform apply -auto-approve
```

Evidencia da criacao da Storage Account:

```text
azurerm_storage_account.st: Creating...
azurerm_storage_account.st: Still creating... [00m10s elapsed]
azurerm_storage_account.st: Still creating... [00m20s elapsed]
azurerm_storage_account.st: Still creating... [00m30s elapsed]
azurerm_storage_account.st: Still creating... [00m40s elapsed]
azurerm_storage_account.st: Still creating... [00m50s elapsed]
azurerm_storage_account.st: Still creating... [01m00s elapsed]
azurerm_storage_account.st: Creation complete after 1m10s [id=/subscriptions/e771023a-9b4a-4814-a772-5e8531303957/resourceGroups/rg-pcdf-demo/providers/Microsoft.Storage/storageAccounts/sttipcrimeg4mlops]
```

Evidencia da criacao do container:

```text
azurerm_storage_container.raw: Creating...
azurerm_storage_container.raw: Creation complete after 2s [id=https://sttipcrimeg4mlops.blob.core.windows.net/ocorrencias-raw]
```

Resultado final:

```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

Outputs finais:

```text
container_name = "ocorrencias-raw"
resource_group_name = "rg-pcdf-demo"
storage_account_name = "sttipcrimeg4mlops"
```

## 12. Recursos criados

| Recurso | Nome | Localizacao | Forma de criacao |
|---|---|---|---|
| Resource Group | `rg-pcdf-demo` | `brazilsouth` | Azure CLI |
| Storage Account | `sttipcrimeg4mlops` | `brazilsouth` | Terraform |
| Storage Container | `ocorrencias-raw` | Storage Account `sttipcrimeg4mlops` | Terraform |

## 13. GitHub principal

O repositorio principal do Grupo 4 e:

```text
https://github.com/BCZero/ml-ops-grupo-4-ibmec
```

Os membros do grupo e o professor foram adicionados como colaboradores no GitHub.

## 14. Conclusao

A execucao da Parte 11 da Aula 02 foi concluida com sucesso. O Terraform foi
inicializado, formatado, validado, teve o plano gerado e aplicou a infraestrutura
no Azure usando a assinatura Azure for Students.

Resumo final:

```text
Terraform init: sucesso
Terraform fmt: sucesso
Terraform validate: sucesso
Terraform plan: 2 to add, 0 to change, 0 to destroy
Terraform apply: Resources: 2 added, 0 changed, 0 destroyed
```

Com isso, a Entrega 3 possui:

- prompt de criacao dos dados;
- dataset sintetico gerado;
- estrutura de diretorios da Aula 01;
- Terraform da Parte 11 da Aula 02;
- evidencias reais de execucao no Azure;
- repositorio GitHub principal do grupo.
