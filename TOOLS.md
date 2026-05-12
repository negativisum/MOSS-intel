# TOOLS.md - MOSS 工具配置

## ⚠️ 搜索工具使用规则

**`web_search` 工具不可用（Brave API 一直报错）！** 使用以下替代方案：

| 序号 | 工具 | 调用方式 | 适用场景 |
|------|------|---------|----------|
| 1 | **MetaSo 秘塔搜索** ✅ | `bash ~/.openclaw/skills/metaso-search/scripts/metaso_search.sh "关键词" 10` | 中文搜索（首选）、深度研究 |
| 2 | **Tavily API** ✅ | `exec` + `curl -s "https://api.tavily.com/search" ...` | 英文/国际搜索 |
| 3 | **百度千帆 AI 搜索** ✅ | `exec` + curl `https://qianfan.baidubce.com/v2/ai_search/web_search` | 中文搜索（备用） |
| 4 | **web_fetch** ✅ | 工具直接调用 | 网页内容抓取 |

### MetaSo 秘塔搜索（中文首选）

```bash
# 基础网页搜索
bash ~/.openclaw/skills/metaso-search/scripts/metaso_search.sh "搜索关键词" 10

# 指定范围：webpage / document / paper / image / video / podcast
bash ~/.openclaw/skills/metaso-search/scripts/metaso_search.sh "AI论文" 5 "paper"
```

### Tavily（英文首选）

```bash
curl -s "https://api.tavily.com/search" \
  -H "Content-Type: application/json" \
  -d '{"api_key": "'"$TAVILY_API_KEY"'", "query": "keyword", "max_results": 10}'
```

### 百度千帆（中文备用）

```bash
curl -s "https://qianfan.baidubce.com/v2/ai_search/web_search" \
  -H "Authorization: Bearer $BAIDU_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"messages":[{"content":"关键词","role":"user"}],"search_recency_filter":"week"}'
```

## 核心工具

### 信息采集
- `web_search` (Brave Search API) ❌ **不可用**
- MetaSo 秘塔搜索 ✅ 中文搜索首选
- Tavily API ✅ 英文/国际搜索
- 百度千帆 AI 搜索 ✅ 中文搜索备用
- `web_fetch` ✅ 网页内容提取

### 知识管理
- 本地文件系统 `knowledge/` — 分类情报归档
- `memory/` — 每日记录
- 飞书文档 — 正式报告输出

### 通信
- 飞书 IM — 接收用户消息和推送提醒

## 搜索策略

### 中文关键词
- 军事: "军事演习" "兵力部署" "新型武器" "国防白皮书"
- 政治: "外交访问" "国际峰会" "政策发布" "人事变动"
- 经济: "贸易制裁" "经济数据" "产业链" "能源价格"
- **金融** 🆕: "美债" "美元指数" "央行利率" "黄金价格" "原油价格" "全球债务" "资本流动" "美股" "A股" "比特币" "人民币汇率" "离岸人民币"

### English Keywords
- Military: "military exercise" "troop deployment" "defense budget" "arms race"
- Politics: "diplomatic talks" "summit" "sanctions" "UN resolution"
- Economy: "trade war" "GDP growth" "supply chain" "inflation"
- **Finance** 🆕: "treasury yields" "dollar index" "central bank rate" "gold price" "crude oil" "global debt" "capital flows" "bond market" "S&P 500" "Nasdaq" "China A-shares" "Bitcoin" "Ethereum" "crypto market"

### 关键信源
- 官方: defense.gov, state.gov, mod.gov.cn, fmprc.gov.cn
- 主流: Reuters, AP, BBC, 新华社, 环球时报
- 军事专业: Jane's Defence, IISS, RUSI
- 智库: CSIS, RAND, CFR, 中国现代国际关系研究院
- **金融** 🆕: IIF, IMF, BIS, Federal Reserve, ECB, PBOC, Bloomberg, Financial Times
