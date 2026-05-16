# うちのにゃんこ — Claude Code プロジェクト情報

## プロジェクト概要

Flutter 製 Android 向けほのぼの猫育成ゲーム。室内（日本の 1K アパート）を舞台に、個性ある猫たちとゆるやかな日常を楽しむカジュアルゲーム。

## 技術スタック

| 役割 | ライブラリ | 補足 |
|------|-----------|------|
| UI | Flutter 3.x (Android) | iOS 展開は将来検討 |
| 状態管理 | flutter_riverpod + riverpod_annotation | コード生成あり |
| ローカル DB | Drift + sqlite3_flutter_libs | コード生成あり |
| 画面遷移 | go_router | 宣言的ルーティング |
| アニメーション | Rive | 猫の動き・インタラクション演出 |

## パッケージ情報

- **pubspec name:** `uchi_no_nyanko`
- **applicationId:** `com.naokins.uchi_no_nyanko`
  - ※ `com.naoki-ns` の `-` が Java パッケージ名に使えないため、flutter create が `naokins` に変換した

## ディレクトリ構成（予定）

```
lib/
├── main.dart
├── app/
│   ├── router.dart          # go_router 設定
│   └── app.dart             # ProviderScope ラッパー
├── features/
│   ├── home/                # ホーム画面（部屋ビュー）
│   ├── cat/                 # 猫プロフィール・ケアアクション
│   ├── room/                # 部屋カスタマイズ
│   ├── catbook/             # 猫図鑑
│   └── shop/                # コンテンツショップ
├── domain/
│   ├── models/              # エンティティ定義
│   └── repositories/        # リポジトリ抽象
├── data/
│   ├── database/            # Drift DB・テーブル定義
│   └── repositories/        # リポジトリ実装
└── shared/
    ├── widgets/             # 共通ウィジェット
    └── utils/               # ユーティリティ
```

## よく使うコマンド

```bash
# 依存関係インストール
flutter pub get

# コード生成（Riverpod / Drift）— ファイル変更のたびに実行
dart run build_runner build --delete-conflicting-outputs

# 差分のみ再生成（高速）
dart run build_runner watch

# 実行
flutter run

# 静的解析
flutter analyze

# テスト
flutter test
```

## 設計原則

- **プレッシャーゼロ** — タイマー・通知・エネルギー制なし
- **猫の個性を大切に** — 各猫に性格パラメータ・記憶システムを持たせる
- **コスメティックのみ F2P** — 進行に影響するペイウォールなし

## 参考ドキュメント

- [コンセプト・世界観](docs/concept.md)
- [ゲームデザイン仕様](docs/game-design.md)
