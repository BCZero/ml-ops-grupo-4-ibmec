# Evidencias Terraform - Azure Cloud Shell

Disciplina: MLOps & CI/CD  
Entrega: Entrega 3 - Em Grupo  
Grupo: Grupo 4  
Projeto: `pcdf-tipificacao-procedimentos`  
Data de execucao: 24/08/2026  
Ambiente: Azure Cloud Shell

## 1. Ambiente Azure

A execucao foi realizada no Azure Cloud Shell usando a assinatura estudantil
ativada no Azure for Students.

Comando executado:

```bash
az account list -o table
```

Evidencia:

```text
Name                CloudName    SubscriptionId                        TenantId                              State    IsDefault
------------------  -----------  ------------------------------------  ------------------------------------  -------  -----------
Azure for Students  AzureCloud   e771023a-9b4a-4814-a772-5e8531303957  da49a844-e2e3-40af-86a6-c3819d704f49  Enabled  True
```

Observacao do Cloud Shell:

```text
Your Cloud Shell session will be ephemeral so no files or system changes will persist beyond your current session.
```

## 2. Versao do Terraform

Comando executado:

```bash
terraform version
```

Evidencia:

```text
Terraform v1.15.8
on linux_amd64
```

## 3. Clone do repositorio GitHub

Comando executado:

```bash
git clone https://github.com/BCZero/ml-ops-grupo-4-ibmec.git
cd ml-ops-grupo-4-ibmec/Entrega_3_Grupo4/pcdf-tipificacao-procedimentos/terraform
```

Evidencia:

```text
Cloning into 'ml-ops-grupo-4-ibmec'...
remote: Enumerating objects: 47, done.
remote: Counting objects: 100% (47/47), done.
remote: Compressing objects: 100% (36/36), done.
remote: Total 47 (delta 2), reused 47 (delta 2), pack-reused 0 (from 0)
Receiving objects: 100% (47/47), 22.00 MiB | 3.87 MiB/s, done.
Resolving deltas: 100% (2/2), done.
```

Conferencia do diretorio Terraform:

```bash
ls -la
```

Evidencia:

```text
total 12
drwxr-xr-x  2 bruno bruno 4096 Aug 24 19:18 .
drwxr-xr-x 10 bruno bruno 4096 Aug 24 19:18 ..
-rw-r--r--  1 bruno bruno 1094 Aug 24 19:18 main.tf
```

## 4. Criacao do Resource Group

Comando executado:

```bash
az group create --name rg-pcdf-demo --location brazilsouth
```

Evidencia:

```json
{
  "id": "/subscriptions/e771023a-9b4a-4814-a772-5e8531303957/resourceGroups/rg-pcdf-demo",
  "location": "brazilsouth",
  "managedBy": null,
  "name": "rg-pcdf-demo",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

## 5. Terraform init

Comando executado:

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

## 6. Terraform fmt

Comando executado:

```bash
terraform fmt
```

Resultado: o comando executou sem mensagens, indicando que nao havia ajustes de
formatacao pendentes no arquivo `main.tf`.

## 7. Terraform validate

Comando executado:

```bash
terraform validate
```

Evidencia:

```text
Success! The configuration is valid.
```

## 8. Terraform plan

Comando executado:

```bash
terraform plan
```

O Terraform leu o Resource Group existente:

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

## 9. Terraform apply

Comando executado:

```bash
terraform apply -auto-approve
```

O Terraform confirmou novamente o plano:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

Criacao da Storage Account:

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

Criacao do container:

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

## 10. Recursos criados

| Recurso | Nome | Localizacao | Observacao |
|---|---|---|---|
| Resource Group | `rg-pcdf-demo` | `brazilsouth` | Criado via Azure CLI |
| Storage Account | `sttipcrimeg4mlops` | `brazilsouth` | Criada via Terraform |
| Storage Container | `ocorrencias-raw` | Storage Account `sttipcrimeg4mlops` | Criado via Terraform, acesso privado |

## 11. Conclusao para o relatorio

A Parte 11 da Aula 02 foi executada com sucesso no Azure Cloud Shell usando a
assinatura Azure for Students. O Terraform inicializou corretamente o provider
`hashicorp/azurerm`, validou a configuracao, gerou um plano com dois recursos a
criar e aplicou a infraestrutura com sucesso. Ao final, foram criados uma
Storage Account e um container privado para armazenar os dados brutos do projeto.

Resumo final:

```text
Terraform init: sucesso
Terraform fmt: sucesso
Terraform validate: sucesso
Terraform plan: 2 to add, 0 to change, 0 to destroy
Terraform apply: Resources: 2 added, 0 changed, 0 destroyed
```
