# 📱 Prolog Pneus - Teste Técnico Flutter

Este projeto foi desenvolvido como parte de um teste técnico para uma vaga de desenvolvedor Flutter. O objetivo foi consumir as APIs da Prolog para:

- Listar pneus disponíveis
- Exibir os detalhes completos de um pneu selecionado

---

## ✅ Funcionalidades

- 🔄 Carregamento inicial da lista de pneus com cache em memória
- 🔍 Visualização completa de informações técnicas do pneu
- 🎨 Interface com layout moderno e responsivo
- 📡 Comunicação com API protegida via token (`x-prolog-api-token`)
- 📂 Estrutura modular e organizada

---

## 📦 Estrutura do projeto

```
lib/
├── models/             # Modelos de dados (Tire, TireSize, Make, etc)
├── services/           # Chamadas HTTP para API da Prolog
├── providers/          # Gerenciamento de estado com Provider
├── screens/            # Telas principais do app (listagem e detalhes)
└── widget/             # Componentes reutilizáveis (TireCard, etc)
```

---

## 🧠 Decisões Técnicas

### Por que `Provider`?

Escolhi usar `Provider` por ser uma solução oficial, simples e eficiente para o tamanho do app. Ele permite centralizar o estado da aplicação e compartilhar os dados entre telas sem complexidade desnecessária. Para esse teste, ele entregou tudo que eu precisava com leveza e boa performance.

### Pré-carregamento na inicialização

Para melhorar a performance e evitar múltiplas chamadas à API, os dados da listagem são carregados **logo no início do app**, no `main.dart`. O provider armazena esses dados e distribui para o app todo, economizando chamadas e deixando a navegação mais fluida.

### Layout da UI

As telas foram construídas com base em imagens de referência fornecidas. Os elementos visuais seguem os seguintes padrões:

- `AppBar` customizado com título e subtítulo
- Lista com `Scrollbar` visível e clicável
- Cards responsivos e com destaque de status por cor:
  - APLICADO: azul
  - ESTOQUE: verde
  - EM ANÁLISE: amarelo
  - DESCARTE: vermelho
- Tela de detalhes segmentada com `Cards` e ícones

---

## 🚀 Como rodar o projeto

1. Clone este repositório
2. Insira sua API Key no serviço:
   - `tire_service.dart` → header `x-prolog-api-token`
3. Execute com:
```bash
flutter pub get
flutter run
```

---

## 📌 Considerações finais

Este projeto demonstra minha preocupação com organização, reuso de código, experiência do usuário e clareza nas decisões. Estou aberto a feedbacks e melhorias!

---

Desenvolvido em Flutter

---

