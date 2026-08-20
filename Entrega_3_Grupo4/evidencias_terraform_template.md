# Evidencias Terraform - Entrega 3

Projeto: pcdf-tipificacao-procedimentos

## Contexto da Parte 11 - Slide 2

A Parte 11 da Aula 02 pede o provisionamento da infraestrutura basica do projeto
com Terraform:

- usar `terraform {}` e `provider "azurerm"`;
- ler o Resource Group existente com `data`;
- criar uma Storage Account;
- criar um container para dados;
- executar `terraform init`, `terraform plan` e `terraform apply`;
- conferir no Portal Azure;
- commitar a pasta `terraform/`.

## Evidencia 1 - Versoes e login

Comandos:

```powershell
terraform version
az account show
```

Cole aqui o print ou saida do terminal:

```text
[SUBSTITUIR PELA EVIDENCIA REAL]
```

## Evidencia 2 - terraform init

Comando:

```powershell
cd pcdf-tipificacao-procedimentos\terraform
terraform init
```

Resultado esperado:

```text
Terraform has been successfully initialized!
```

Cole aqui o print ou saida do terminal:

```text
[SUBSTITUIR PELA EVIDENCIA REAL]
```

## Evidencia 3 - terraform plan

Comando:

```powershell
terraform plan
```

Resultado esperado:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

Cole aqui o print ou saida do terminal:

```text
[SUBSTITUIR PELA EVIDENCIA REAL]
```

## Evidencia 4 - terraform apply

Comando:

```powershell
terraform apply -auto-approve
```

Resultado esperado:

```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

Cole aqui o print ou saida do terminal:

```text
[SUBSTITUIR PELA EVIDENCIA REAL]
```

## Evidencia 5 - Conferencia no Azure

Conferir no Portal Azure:

```text
Resource Group: rg-pcdf-demo
Storage Account: sttipcrimeg4mlops
Container: ocorrencias-raw
```

Cole aqui o print do Portal Azure:

```text
[SUBSTITUIR PELO PRINT REAL]
```

## Evidencia 6 - Commit no GitHub

Comandos:

```powershell
git add terraform/
git commit -m "infra: storage account via terraform"
git push
```

Cole aqui o link do commit/repository:

```text
[SUBSTITUIR PELO LINK REAL]
```
