# HEARTBEAT.md - MOSS 定时任务

## 每日情报采集 (通过 Cron 触发)

MOSS 的每日情报采集通过 isolated cron job 执行，不依赖 heartbeat。

如需通过 heartbeat 做额外检查，可在此添加任务。
