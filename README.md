[![Flutter](https://img.shields.io/badge/Flutter-Dart-7F77DD?style=flat)](https://flutter.dev/) [![Dart](https://img.shields.io/badge/Dart-3.0-1D9E75?logo=dart&logoColor=white&style=flat)](https://dart.dev) [![CI](https://img.shields.io/github/actions/workflow/status/Syzygy-Hub/syzygy-ai-flutter/ci.yml?label=ci&style=flat)](https://github.com/Syzygy-Hub/syzygy-ai-flutter/actions/workflows/ci.yml) [![Version](https://img.shields.io/badge/version-1.0.0-D85A30?style=flat)](https://github.com/Syzygy-Hub/syzygy-ai-flutter/releases) [![License](https://img.shields.io/badge/License-MIT-green?style=flat)](LICENSE)

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/Syzygy-Hub/.github/main/brand/assets/banners/syzygy-banner-dark-1200.png">
  <img src="https://raw.githubusercontent.com/Syzygy-Hub/.github/main/brand/assets/banners/syzygy-banner-light-1200.png" alt="Syzygy" width="600">
</picture>

# syzygy-ai-flutter

AI layer contracts for the Syzygy Flutter ecosystem — providing abstract interfaces for LLM integration, agent protocols, retrieval-augmented generation, memory management, and token streaming.

## About

syzygy-ai-flutter defines the AI contract layer that every Syzygy Flutter application or service can depend on. It provides abstract classes for integrating large language models, running agentic ReAct loops, performing retrieval-augmented generation, managing conversation context, and streaming tokens — without coupling to any specific AI provider or backend implementation.

## Role in the Syzygy Ecosystem

`syzygy-ai-flutter` is the AI peer layer. It depends on `syzygy-foundation-flutter` and nothing else. Concrete AI backend integrations extend these contracts without this package needing to change.

Full ecosystem architecture: [ecosystem-fragment.md](https://github.com/Syzygy-Hub/.github/blob/main/docs/ecosystem-fragment.md)

### Contracts

| Contract | Description |
|---|---|
| `LLMProvider` | Abstract interface for LLM backend integration |
| `AgentProtocol` | ReAct loop contract — Reason → Act → Observe |
| `RAGProvider` | Retrieval-augmented generation interface |
| `MemoryManager` | Conversation context management contract |
| `StreamHandler` | Token streaming abstraction |

## Release Process

Releases follow the Syzygy tag-push release flow:

1. Create a `release/X.X.X` branch
2. Bump the version in `syzygy.yml`, `pubspec.yaml`, the README badge, and `CHANGELOG.md`
3. Open a PR to `main` and wait for CI to pass
4. Merge the PR
5. Push the tag: `git tag X.X.X` and `git push origin X.X.X`
6. The tag push triggers the org-level release workflow which validates `syzygy.yml` matches the tag, extracts the CHANGELOG entry, publishes to pub.dev, and creates the GitHub Release

For the full release standard see the [Syzygy-Hub/.github release standard](https://github.com/Syzygy-Hub/.github/blob/main/engineering/standards/release-standard.md).

## Platforms

| Platform | Min Version | Package Manager | Status |
|---|---|---|---|
| Flutter | 3.10+ | pub.dev | ✅ Supported |

## Requirements

- Flutter 3.10+
- Dart 3.0+

## Installation

```yaml
dependencies:
  syzygy_ai_flutter: ^1.0.0
```

```dart
import 'package:syzygy_ai_flutter/syzygy_ai_flutter.dart';
```

## Architecture

**Depends on:** syzygy-foundation-flutter

**Used by:** AI feature libraries and application layers that require LLM, agent, or RAG integration

For the full ecosystem architecture see [syzygy-ecosystem.md](https://github.com/Syzygy-Hub/.github/blob/main/engineering/architecture/syzygy-ecosystem.md).

## Contributing

Contributions are welcome. Please follow the [Syzygy engineering standards](https://github.com/Syzygy-Hub/.github/tree/main/engineering/standards) when submitting pull requests.

## License

MIT — see [LICENSE](LICENSE)
