# SmartFit - Documentação Técnica

## Introdução

**Descrição do Projeto:**  
O SmartFit é um projeto front-end desenvolvido em Flutter que simula a experiência de login, cadastro e funcionalidades básicas de uma academia. O objetivo é criar uma interface funcional para Android, permitindo aos usuários realizar ações como login, cadastro, cálculo de IMC e simulação de pagamentos.

**Objetivo:**  
Servir como protótipo funcional, demonstrando conceitos de design, navegação e experiência do usuário em um ambiente fictício de academia.


## Arquitetura

- **Visão Geral:** Estrutura modular organizada em pastas por responsabilidade, como telas, estilos, widgets reutilizáveis e serviços.
- **Fluxo de Dados:**  
  - Lógica de negócios simulada através de mocks.  
  - Gerenciamento centralizado de rotas no arquivo `routes.dart`.


## Tecnologias Utilizadas

- **Flutter:** Framework principal.  
- **Dart:** Linguagem de programação.  
- **Plataforma:** Android.  


## Configuração e Instalação

**Requisitos do Sistema:**  
- Flutter SDK: 3.x ou superior.  
- Ambiente de desenvolvimento: Android Studio ou VS Code.  
- Emulador Android: Versão mínima 8.0 (API 26).  

**Passos para Rodar o Projeto:**  
1. Clone o repositório.  
2. Execute os comandos:  
   ```bash
   flutter pub get  # Instalar dependências
   flutter run      # Rodar o projeto localmente

   ```
   
## Estrutura de Pastas

   ```bash
    lib/
    ├── main.dart               // Ponto de entrada
    ├── app/
    │   ├── routes.dart         // Gerencia as rotas
    ├── screens/                // Contém as telas
    │   ├── login_screen.dart   // Tela de login
    │   ├── signup_screen.dart  // Tela de cadastro
    │   ├── home_screen.dart    // Tela principal pós-login
    │   ├── imc_screen.dart     // Tela de cálculo de IMC
    │   ├── payment_screen.dart // Tela de pagamento
    ├── styles/                 // Estilos das telas
    ├── widgets/                // Widgets reutilizáveis
    ├── services/               // Simulação de lógica de negócios

   ```

## Principais Funcionalidades
1. Login e Cadastro: Telas com validações básicas.
2. Cálculo de IMC: Baseado nos dados inseridos.
3. Simulação de Pagamento: Via cartão de crédito ou PIX.
4. Navegação: Gerenciamento centralizado de rotas.

## Rotas e Navegação
1. `/login`: Tela de login.
2. `/signup`: Tela de cadastro.
3. `/home`: Tela principal pós-login.
4. `/imc`: Tela de cálculo de IMC.
5. `/payment`: Tela de pagamento.






