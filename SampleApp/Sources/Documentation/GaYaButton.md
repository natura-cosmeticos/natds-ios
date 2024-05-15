# Guia de Uso - GaYaButton

## Visão Geral

O componente `GaYaButton` é essencial para interações no aplicativo, permitindo que os usuários façam escolhas e executem ações com um simples toque. Este guia detalha as configurações disponíveis para personalizar o botão de acordo com as necessidades do seu design de interface.

### Como Usar

Para começar a usar o `GaYaButton`, siga as instruções abaixo para configurar os diferentes estilos e funcionalidades.

## Estilos de Botão

**1. Filled**
   - **Descrição**: Botão com fundo colorido.
   - **Código**:
     ```swift
     let filledButton = GaYaButton(style: .filled)
     filledButton.configure(title: "Filled")
     ```

**2. Outlined**
   - **Descrição**: Botão com borda e fundo transparente.
   - **Código**:
     ```swift
     let outlinedButton = GaYaButton(style: .outlined)
     outlinedButton.configure(title: "Outlined")
     ```

**3. Ghost**
   - **Descrição**: Botão sem borda ou fundo, apenas texto.
   - **Código**:
     ```swift
     let textButton = GaYaButton(style: .ghost)
     textButton.configure(title: "Ghost")
     ```
     
**4. Tonal**
   - **Descrição**: Botão com fundo colorido, cores mais claras.
   - **Código**:
     ```swift
     let tonalButton = GaYaButton(style: .tonal)
     tonalButton.configure(title: "Tonal")
     ```

## Ícones

**Posicionamento de Ícones**
   - **Descrição**: Adicione ícones ao botão para melhorar a identificação visual.
   - **À Direita**:
     ```swift
     let rightIconButton = GaYaButton(style: .contained)
     rightIconButton.configure(title: "Com Ícone", icon: UIImage(named: "rightIcon"), position: .right)
     ```
   - **À Esquerda**:
     ```swift
     let leftIconButton = GaYaButton(style: .contained)
     leftIconButton.configure(title: "Com Ícone", icon: UIImage(named: "leftIcon"), position: .left)
     ```

## Tamanho e Ativação

**Tamanhos Disponíveis**
   - **Semi, Semix e Medium**
     - Ajuste o tamanho para adequar-se ao contexto de uso.
     
     ```swift
        private let containedFullMediumButton: GaYaButton = {
            let button = GaYaButton(style: .filled, size: .medium)
            button.configure(title: "Filled - Medium")
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        private let disableContainedFullSemixButton: GaYaButton = {
            let button = GaYaButton(style: .filled, size: .semix)
            button.configure(title: "Disabled Filled - Semix")
            button.isEnabled = false
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

        private let outlinedFullSemiButton: GaYaButton = {
            let button = GaYaButton(style: .outlined, size: .semi)
            button.configure(title: "Outlined - Semi")
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    ```

**Ativação**
   - **Habilitar/Desabilitar Botão**
     - Gerencie se o botão pode ser interagido pelo usuário.
     
     ```swift
     let disabledButton = GaYaButton(style: .filled)
     disabledButton.isEnabled = false
     disabledButton.configure(title: "Desabilitado")
     ```

## Temas

**Aplicando Temas**
   - **Descrição**: Customize o tema do botão para corresponder ao flavor visual do seu app.
   - **Exemplo**:
     ```swift
     let themeButton = GaYaButton(style: .contained, theme: .avonLight)
     themeButton.configure(title: "Tema Avon")
     ```

