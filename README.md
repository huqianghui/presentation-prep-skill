# presentation-prep：做 PPT 之前，先把演讲想清楚

一个给 AI 助手用的 skill，是 PPT 生成 skill 的**前置步骤**。它不做幻灯片，而是按杰瑞·魏斯曼《演讲大师课》第 1 册《说的艺术》的方法，和你一起分阶段把一场演讲梳理清楚，最后产出一份演讲简报和逐页大纲，再交给 `pptx` 之类的 skill 去生成 PPT。

## 它会和你讨论什么

贯穿始终的是书里的四个关键问题：**目的是什么？听众是谁、诉求是什么？罗马石柱（核心要点）是什么？为什么按这个顺序（选哪种叙述结构）？**

讨论分十个阶段，一次只推进一个，先听你说，再给草案和追问，你确认了才往下：

| 阶段 | 讨论什么 | 产出 |
|---|---|---|
| 0 场合 | 题目、听众、时长、形式、已有材料 | 场合说明 |
| 1 目的 | 听完之后希望听众做什么 | 一句话目的 |
| 2 听众与诉求 | 谁、关心什么、担心什么、可能问什么 | 听众画像与预判问题 |
| 3 主线问题 | 这场演讲回答的那个问题，和一句话主张 | 主线问题 + 主张 |
| 4 头脑风暴 | 数据、案例、故事、观点，先不评判 | 素材清单 |
| 5 罗马石柱 | 把素材归成 3~5 根石柱，删掉无关的 | 石柱列表 |
| 6 叙述结构 | 16 种结构里选一种，排出顺序 | 有顺序的主线 |
| 7 开场白 | 7 种开场白里起草 2~3 个候选 | 定稿开场 |
| 8 串联与收尾 | 外部串词、图表串联、收尾、提问预案、时间分配 | 串联方案 |
| 9 逐页大纲 | 每页标题（论断）、要点、素材、图 | 逐页大纲 |

也可以**审稿**：把已有的 PPT、大纲或文章给它，它按书里的最佳实践诊断目的、听众关心点、主线、石柱、结构、开场和串联，给出按影响排序的改进建议，再从最薄弱的阶段开始讨论。

讨论过程中，简报会实时写进当前目录的 `briefs/<日期>-<题目>.md`。

## 安装

### Claude Code

```text
/plugin marketplace add huqianghui/presentation-prep-skill
/plugin install presentation-prep@presentation-prep
```

或者手动：

```bash
git clone https://github.com/huqianghui/presentation-prep-skill.git
cd presentation-prep-skill && scripts/install.sh
```

`install.sh` 会把 skill 软链接到 `~/.claude/skills`、`~/.codex/skills`、`~/.copilot/skills`、`~/.agents/skills`，一次装好 Claude Code、Codex 和 GitHub Copilot。以后 `git pull` 就能更新。

### Codex（CLI 与 Desktop）

在 Codex 里直接说：

```text
$skill-installer install https://github.com/huqianghui/presentation-prep-skill/tree/main/skills/presentation-prep
```

或者用上面的 `install.sh`。装好后重启 Codex。

### GitHub Copilot（VS Code、Copilot CLI）

用上面的 `install.sh`，或者把 `skills/presentation-prep` 目录复制到 `~/.copilot/skills/`（个人）或项目的 `.github/skills/`（团队共享）。

### Claude Desktop / claude.ai

1. 从 [Releases](https://github.com/huqianghui/presentation-prep-skill/releases/latest) 下载 `presentation-prep.zip`（也可以在仓库里运行 `scripts/package.sh` 自己打包）；
2. 打开 **Settings → Capabilities → Skills**，点 **Upload skill**，选这个 zip；
3. 确认 skill 已打开。

## 使用

直接说你要做什么就会触发，例如：

- "下周要给客户讲 agent 平台的选型，帮我先理一下思路"
- "我要做一个 PPT，讲 AI 在我们团队的演进"
- "帮我看看这个 PPT 的结构有没有问题"（附上文件）

也可以显式调用：Claude Code 里用 `/presentation-prep`，Codex 里用 `$presentation-prep`。

梳理完成后，它会把简报交给当前环境里的 PPT 生成 skill（`pptx`、`frontend-slides` 等），并要求以简报的逐页大纲为准。

## 目录

```text
.claude-plugin/          Claude Code 插件与 marketplace 清单
skills/presentation-prep/
  SKILL.md               讨论流程、审稿模式、简报格式、交接规则
  references/weissman.md 16 种叙述结构、7 种开场白、7 种外部串词、5 种图表串联
scripts/install.sh       软链接到本机各 agent 的 skills 目录
scripts/package.sh       打包 Claude Desktop 用的 zip
```

## 来源

方法来自杰瑞·魏斯曼（Jerry Weissman）《魏斯曼的演讲大师课 1：说的艺术》（Presenting to Win）。`references/weissman.md` 是读书时整理的要点清单，完整内容请阅读原书。读书笔记：[魏斯曼演讲大师课读书笔记：结构、开场与串联](https://github.com/huqianghui/mindforge/blob/main/book/%E9%AD%8F%E6%96%AF%E6%9B%BC%E6%BC%94%E8%AE%B2%E5%A4%A7%E5%B8%88%E8%AF%BE%E8%AF%BB%E4%B9%A6%E7%AC%94%E8%AE%B0%EF%BC%9A%E7%BB%93%E6%9E%84%E3%80%81%E5%BC%80%E5%9C%BA%E4%B8%8E%E4%B8%B2%E8%81%94.md)。

## License

MIT
