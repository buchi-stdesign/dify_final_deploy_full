# Dify Vue フロントエンド（開発用）

## 🔧 主な構成
- `src/pages/`: 各画面
- `src/layouts/`: 管理画面の外枠
- `src/locales/`: 多言語（ja.ts など）
- `App.vue`: アプリのエントリーポイント
- `vite.config.ts`: Vite構成
- `tsconfig.json`: TypeScript構成

## 🚀 開発手順
```bash
npm install
npm run dev
```

## 📦 ビルドしてRenderへ反映
```bash
npm run build
# → dist/ フォルダが生成されるので、Render構成の frontend/dist に上書き
```

## 🎨 カスタマイズ例
- ロゴ変更 → `public/` や `App.vue`
- 日本語表記変更 → `src/locales/ja.ts`
