## MOSS 知识库接入 Git 完成

### 仓库信息

- **GitHub**: https://github.com/negativisum/MOSS-intel
- **分支**: `main`
- **时间**: 2026-05-12

### 知识库结构

| 目录 | 内容 | 文件数 |
|------|------|--------|
| 核心配置 | AGENTS/SOUL/MEMORY/TOOLS等 | 7 |
| `knowledge/analysis/` | 综合分析报告 | 30 |
| `knowledge/military/` | 军事情报归档 | 27 |
| `knowledge/politics/` | 政治情报归档 | 20 |
| `knowledge/economy/` | 经济金融归档 | 19 |
| `memory/` | 每日简报 | 13 |

### 自动同步

- **脚本**: `sync.sh`
- **Cron**: `0 23 * * * bash /Users/botbot/botwork/agents/MOSS/sync.sh`
- **日志**: `/tmp/moss-git-sync.log`
