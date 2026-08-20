# Checklist final - Entrega 3

## 1. PDF

Arquivo base criado:

```text
Entrega_3_Grupo4/Relatorio_Entrega3_Grupo4_BASE.pdf
```

Antes de enviar, substituir a secao de evidencias pendentes pelas evidencias
reais do Terraform:

- `terraform version`
- `az account show`
- `terraform init`
- `terraform plan`
- `terraform apply -auto-approve`
- print do Portal Azure mostrando Storage Account e container
- link do commit no GitHub

Use tambem:

```text
Entrega_3_Grupo4/evidencias_terraform_template.md
```

## 2. ZIP para envio por e-mail ao professor

Arquivo criado:

```text
Entrega_3_Grupo4/Entrega3_Grupo4_estrutura_diretorios.zip
```

Conteudo:

```text
pcdf-tipificacao-procedimentos/
  README.md
  .gitignore
  data/ocorrencias_sinteticas.csv
  terraform/main.tf
  pulumi/
  airflow/dags/
  kubeflow/
  app/
  k8s/
  github/workflows/
```

## 3. Execucao Terraform

Na maquina com Azure CLI e Terraform instalados:

```powershell
cd pcdf-tipificacao-procedimentos\terraform
az login
az account show
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply -auto-approve
```

Resultado esperado no `plan`:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

Resultado esperado no `apply`:

```text
Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## 4. GitHub principal

1. Escolher o GitHub de um integrante como repositorio principal.
2. Criar o repositorio, por exemplo `pcdf-tipificacao-procedimentos`.
3. Subir a estrutura criada.
4. Adicionar os outros integrantes como colaboradores.
5. Adicionar o professor como colaborador.
6. Enviar o link do repositorio ao professor.

Comandos sugeridos:

```powershell
cd pcdf-tipificacao-procedimentos
git init
git add .
git commit -m "setup inicial entrega 3"
git branch -M main
git remote add origin https://github.com/USUARIO/pcdf-tipificacao-procedimentos.git
git push -u origin main
```

Depois do Terraform:

```powershell
git add terraform/
git commit -m "infra: storage account via terraform"
git push
```
