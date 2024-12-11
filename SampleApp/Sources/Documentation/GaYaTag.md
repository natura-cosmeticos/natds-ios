# Guia de Uso - GaYaTag

> 📢 O GaYaTag faz parte da evolução contínua de componentes do GaYa Design System. Ele foi lançado como um novo componente mas o antigo Tag permanecerá disponível para uso mas não receberá mais atualizações ou suporte ativo. Encorajamos a migração para o GaYaTag o quanto antes para aproveitar as melhorias e garantir compatibilidade futura.


## Visão Geral

O componente `GaYaTag` permite que os usuários rotulem, categorizem ou organizem itens usando palavras-chave que os descrevem.


| Prop Figma       | Prop Swift       |  Valores                    | Status            |
| -------------- | -------------- | ------------------------- | ----------------- |
| Colors          | color          |  Primary, PrimaryDarkest, PrimaryLightest, Secondary, SecondaryDarkest, SecondaryLightest, Alert, AlertDarkest, AlertLightest, Success, SuccessDarkest, SuccessLightest, Warning, WarningDarkest, WarningLightest, Info, InfoDarkest, InfoLightest | ✅  Disponível       |
| Size          | size           | small, standard      | ✅  Disponível       |
| Position          | style      | center, right, left               | ✅  Disponível       |
| Icon          | icon           | -         | ✅  Disponível       |
| Label          | text          | Texto | ✅  Disponível       |

### Changelog

Para acompanhar a evolução deste e de outros componentes acesse: [https://github.com/natura-cosmeticos/natds-ios/blob/master/CHANGELOG.md](https://github.com/natura-cosmeticos/natds-ios/blob/master/CHANGELOG.md)

### Como Usar

Para começar a usar o `GaYaTag`, siga as instruções abaixo para configurar os diferentes estilos e funcionalidades.

<p align="center">
  <img alt="1" src="./images/gayatag1.png" width="40%"> 
  <img alt="2" src="./images/gayatag2.png" width="40%"> 
</p>

```swift
    let tag = GaYaTag(style: .right, icon: getIcon(.outlinedActionMic))
    tag.configure(text: "Tag Icon Right")
    tag.configure(color: .secondaryLightest)
    tag.configure(size: .standard)
```
