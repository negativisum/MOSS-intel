## MOSS 知识库 Git 接入 - 完成总结

### GitHub 仓库杯子

- **仓库**: https://github.com/negativisum/MOSS-intel
- **分支**: `main`
- **最新提交**: `489ef32` — "Daily sync: 2026-05-13"

### 接入过程 (2026-05-12 ~ 05-13)

1. 在 `/Users/botbot/botwork/agents/MOSS/` 初始化 git
2. 首次提交 137 文件（knowledge + memory + 核心配置）
3. 创建 GitHub 仓库 `negativisum/MOSS-intel`
4. 推送成功
5. 遇到 GitHub 直连不稳定 → 配了 SSH key和 cron 自动同步
6. 本地文件丢失 → 从 GitHub 恢复完成

### 自动同步

| 机制 | 状态 |
|------|------|
| sync.sh | ✅ 每日增量提交+推送 |
| cron (23:00) | ✅ `crontab -l` 已配置 |
| GitHub 更新 | https://github.com/negativisum/MOSS-intel |

### 注意

- `nehrulab` GitHub 账号目前不存在，先用 `negativisum` — 创建后可以 fork 或 transfer
- GitHub 国内直连偶尔超时，sync.sh 有容错（push 失败不阻断）
- 只有 Git 追踪的内容在仓库中，skills/和原始 JSON 被 .gitignore 排除
