# Project Pokedex

An **Azure AI Foundry** project designed for scanning, identifying, and managing Pokemon TCG collections. This serves as a practical implementation of **Agentic Workflows** and **Multimodal AI** for the **AI-103** certification path.

---

## Technologies Used
- **Terraform**: Infrastructure as Code (utilizing the latest `azurerm` v4.x provider)
- **Git / GitHub**: Version Control and CI/CD Pipeline hosting
- **Azure AI Services**: 
  - **Azure AI Foundry**: Unified platform for Hub and Project management
  - **Azure OpenAI (GPT-4o)**: Multimodal Vision for card identification
  - **Azure AI Search**: (Planned) Vector database for collection RAG
- **Unity**: (Planned) Frontend interface for live camera scanning

---

## Useful Links
- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure AI Foundry Portal](https://ai.azure.com)

---

### Step 1: Project Setup
Focusing on a clean, modular repository structure. The infrastructure is defined using Terraform with a remote state backend stored in Azure Blob Storage to ensure consistency across environments.

### Step 2: Core Infrastructure
Initial deployment includes the Resource Group, Terraform backend storage, and the **Azure AI Foundry Hub & Project** architecture. This setup leverages **System-Assigned Managed Identities** to follow Azure security best practices.