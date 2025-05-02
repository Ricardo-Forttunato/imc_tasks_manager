# PROJETO INTEGRADOR - ANALISE DE SOLUÇÕES INTEGRADAS PARA ORGANIZAÇÕES

## Alunos

- João Ricardo Fortunato da Silva

##

## Resumo

O **IMC Tasks Manager** é um aplicativo inovador desenvolvido em Flutter, projetado para facilitar o gerenciamento de tarefas relacionadas ao Índice de Massa Corporal (IMC). Com uma interface intuitiva e funcionalidades práticas, o aplicativo ajuda os usuários a organizar e acompanhar suas atividades, promovendo uma rotina mais saudável e eficiente.

##

## Descrição do Projeto

O **IMC Tasks Manager** é um aplicativo desenvolvido em Flutter para auxiliar no gerenciamento de tarefas relacionadas ao Índice de Massa Corporal (IMC). Ele permite que os usuários organizem, acompanhem e concluam tarefas de forma eficiente, promovendo uma melhor gestão de atividades relacionadas à saúde e bem-estar.

##

## Funcionalidades

- Interface amigável e intuitiva.
- Tema escuro ativado com base na configuração do sistema e alternavel.
- Calculo do indice de massa corporal do usuário.
- botão de limpeza dos campos preenchidos em caso de erro de digitação.
- Sugestão de tarefas baseadas no IMC do usuário.
- Cadastro de tarefas personalizadas.
- Organização de tarefas por categorias.
- Exclusão de tarefas após concluídas.
- Botão para limpar todas as tarefas com dupla confirmação.

##

## Tecnologias Utilizadas

- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação utilizada no Flutter.
- **SharedPreferences**: Para armazenamento de pequenas quantidades de dados de forma persistente.

##

## Modelo de Modelagem de Dados com Armazenamento Local

Para a modelagem de dados, foi utilizado o package **shared_preferences** no arquivo `Todo_repository.dart`. Este package permite o armazenamento local de dados simples, como pares chave-valor, facilitando a persistência de informações relacionadas às tarefas do usuário.
Características principais:

- Armazena dados primitivos como int, double, bool, String e List<String>.
- Persistência automática, ou seja, os dados permanecem salvos mesmo após o fechamento do aplicativo.
- Uso simples, sem necessidade de banco de dados complexo.
- Compatível com Android e iOS, utilizando NSUserDefaults no iOS/macOS e SharedPreferences no Android.

##

## Como Executar o Projeto

1. Certifique-se de ter o Flutter instalado em sua máquina.
2. Clone este repositório:
   ```bash
   git clone https://github.com/Ricardo-Forttunato/imc_tasks_manager
   ```
3. Acesse o diretório do projeto:
   ```bash
   cd imc_tasks_manager
   ```
4. Instale as dependências:
   ```bash
   flutter pub get
   ```
5. Execute o aplicativo:
   ```bash
   flutter run
   ```
   Obs: antes de executar o flutter run execute o flutter doctor para garantir que todas depencias foram criadas.

##

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues ou enviar pull requests.

##

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais informações.
