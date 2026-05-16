# うちのにゃんこ

> ほのぼの室内猫育成ゲーム — あなたの部屋に、猫のいる日常を。

Flutter 製 Android 向けカジュアルゲームです。日本の室内空間を舞台に、個性豊かな猫たちとゆるやかな時間を過ごせます。

---

## スクリーンショット

<!-- TODO: スクリーンショットを追加 -->

---

## 特徴

- **個性ある猫たち** — 一匹一匹が異なる性格・記憶・関係性を持つ
- **あなただけの部屋** — 家具やインテリアを自由にカスタマイズ
- **プレッシャーゼロ** — タイマーなし・通知なし・エネルギー制なし
- **季節と時間の流れ** — 朝〜夜・春〜冬の情緒ある環境変化
- **Rive アニメーション** — なめらかで表情豊かな猫の動き

---

## 技術スタック

| 役割 | ライブラリ |
|------|-----------|
| UI フレームワーク | Flutter (Android) |
| 状態管理 | Riverpod + riverpod_annotation |
| ローカル DB | Drift |
| 画面遷移 | go_router |
| アニメーション | Rive |

---

## 開発環境セットアップ

**必要なもの:**

- Flutter 3.x 以上
- Android Studio または VS Code（Flutter 拡張）
- Android SDK

**手順:**

```bash
# リポジトリをクローン
git clone git@github.com:naoki-ns/uchi-no-nyanko.git
cd uchi-no-nyanko

# 依存関係のインストール
flutter pub get

# コード生成（Riverpod / Drift）
dart run build_runner build --delete-conflicting-outputs

# アプリ起動（接続済み Android デバイスまたはエミュレーターが必要）
flutter run
```

---

## ドキュメント

- [コンセプト・世界観](docs/concept.md)
- [ゲームデザイン仕様](docs/game-design.md)

---

## ライセンス

MIT License — 詳細は [LICENSE](LICENSE) を参照してください。
