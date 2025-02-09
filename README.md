# Atualizador do Winget
Este script PowerShell automatiza o processo de atualização para o gerenciador de pacotes Winget. Ele verifica a versão mais recente do Winget no GitHub e a instala se uma versão mais nova estiver disponível.

## Recursos Principais
* Verifica a versão mais recente do Winget disponível no GitHub.
* Faz o download e instala o instalador `.msixbundle` mais recente do Winget.
* Lida com possíveis erros durante a instalação e verificação de versão.
* Fornece saídas informativas ao usuário.

## Tecnologias Utilizadas
* PowerShell
* `Invoke-WebRequest` (para baixar arquivos)
* `Add-AppxPackage` (para instalar o pacote Winget)

## Pré-requisitos
* PowerShell 5.1 ou superior.
* Acesso à internet para baixar o instalador do Winget do GitHub.

## Instalação
1. **Baixe o script:** Faça o download de `Update Winget.ps1` do repositório.
2. **Salve o script:** Salve o arquivo em um local acessível pelo seu ambiente PowerShell.

## Uso
1. **Abra o PowerShell:** Inicie o PowerShell como administrador.
2. **Navegue até o diretório do script:** Use o comando `cd` para navegar até o diretório onde você salvou `Update Winget.ps1`. Por exemplo: `cd C:\caminho\para\script`
3. **Execute o script:** Execute o script usando o seguinte comando: `.\Update Winget.ps1`
O script executará automaticamente:
* Verificará a versão do Winget atualmente instalada.
* Verificará a versão mais recente do Winget no GitHub.
* Instalará a versão mais recente, se uma atualização estiver disponível.
* Relatará os resultados no console.

## Configuração
Não há arquivos de configuração para este script. Todas as configurações estão codificadas diretamente no próprio script (especificamente, o endpoint da API do GitHub usado para recuperar informações sobre a última versão do Winget).

## Estrutura do Projeto
O projeto consiste em dois arquivos principais:
* **`Update Winget.ps1`:** O script principal do PowerShell que executa a atualização do Winget.
* **`LICENSE`:** O arquivo da Licença MIT.

## Contribuição
Este projeto aceita contribuições. Por favor, veja o arquivo `LICENSE` para diretrizes de contribuição.

## Tratamento de Erros e Mensagens
* **`Winget não está instalado neste sistema.`:** Esta mensagem indica que o Winget não foi encontrado no sistema. O script prosseguirá para instalar a versão mais recente.
* **`Erro ao verificar a instalação do Winget.`:** Indica que ocorreu um erro ao tentar obter a versão atual do Winget. Verifique sua configuração do PowerShell e certifique-se de que o Winget está corretamente instalado.
* **`Erro: Não foi possível encontrar a última versão do Winget no GitHub.`:** Indica um problema ao conectar-se ao GitHub ou ao recuperar informações de lançamento. Verifique sua conexão com a internet e certifique-se de que o endpoint da API do GitHub (`https://api.github.com/repos/microsoft/winget-cli/releases/latest`) está acessível.

## Licença
Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Explicação do Script
O script `Update Winget.ps1` contém várias funções:
* **`Get-InstalledWingetVersion`:** Verifica a instalação do Winget e recupera sua versão.
* **`Get-LatestWingetVersion`:** Recupera a versão mais recente do Winget a partir da API do GitHub.
* **`Install-LatestWinget`:** Faz o download e instala a versão mais recente do Winget.
* **`Get-LatestWingetRelease`:** Recupera o URL de download da versão mais recente do Winget a partir da API do GitHub.
* **`Update-LatestWinget`:** Orquestra todo o processo de atualização, chamando as outras funções.