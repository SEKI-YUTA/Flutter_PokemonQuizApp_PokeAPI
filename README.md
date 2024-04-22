# このプロジェクトをクローンしてから実行までの流れ

1. このリポジトリをクローンする
2. 通常の Flutter プロジェクトのセットアップをする(`flutter pub get`など)
3. Firebase のプロジェクトで必要な google-services.json や GoogleService-Info.plist をダウンロードして、`android/app`と`ios/Runner`ディレクトリに配置する
4. `./gradlew signingReport`を実行して署名情報を取得する
5. 2 の手順で出力された SHA1 の値を Firebase のプロジェクトに登録する

> [!WARNING]
> この手順を実行しないと、Firebase で使用するファイルなどがないのでビルド自体ができません。

# ポケモンクイズアプリ

ポケモンのステータスからポケモンの名前を推測するゲームです。
ヒント１
HP, こうげき、ぼうぎょ、とくこう、とくぼう、すばやさの６つのステータスの値が与えられます。
ヒント２
ポケモンの重さ、高さ、タイプが与えれます。
ヒント３
ポケモンの図鑑番号が与えれます。

これら 3 つのヒントからポケモンの名前を当てる事ができれば、ポケモンを捕まえる事ができて、ボックスから確認できます。

## 各種画面

| 図鑑画面                                           | クイズ画面                             | ボックス画面                         | 設定画面                                     |
| -------------------------------------------------- | -------------------------------------- | ------------------------------------ | -------------------------------------------- |
| ![dictionary](assets/readme/dictionary_screen.png) | ![quiz](assets/readme/quiz_screen.png) | ![box](assets/readme/box_screen.png) | ![setting](assets/readme/setting_screen.png) |
