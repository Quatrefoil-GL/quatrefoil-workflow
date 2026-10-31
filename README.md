
Quatrefoil Workflow
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Demo http://r.tiye.me/Quatrefoil-GL/quatrefoil-workflow/

前端部署使用 COS Action 正式 v1.2.0 的 `public-base-url` 内置 verify，无额外校验脚本。
PR 的 COS/CDN 目录按编号/run/attempt 隔离，Vite base 与上传 prefix 同源；生产
`Quatrefoil-GL/quatrefoil-workflow/` 前缀与原 web-assets rsync 路径不变。
上传按事件/分支排队，job/上传分别限制为 15/10 分钟，现有类型门禁保留。
模板使用配套的正式 Calcit/procs 0.32.1，入口明确为 JS/browser。
采用已发布 Quatrefoil 0.2.0 的一致正式依赖图（Quaternion 0.2.19、
Pointed Prompt 0.0.24、Touch Control 0.0.35、JS FFI 0.2.9），不含 alpha/hash；
控制器样式直接来自同一 Caps 模块，不再额外安装旧 npm 控制器。
组件返回具体 Component，事件回调声明 Unit dispatch 合同；
使用 defref/watch!/match，移除未使用的 portal/tab 状态读取和 getter。
示例的点击操作与场景内容保持不变，不新增验证脚本或测试框架。
环境变量和 canvas 读取使用 Option 接收者方法，缺省 release 和缺少 canvas
时的失败行为不变；移除旧单版本安装预批准，使用明确的 60 分钟包龄策略。
现有开放状态边界仍保留，不以伪类型断言消除真实边界。
本轮只配对升级正式工具链与依赖；示例源码、点击操作、相机和 `hud!` 页面提示不变。
Actions 使用精确正式 tag（接受 tag 可移动的风险），不另加测试或上传校验脚本。

本轮通过官方 CLI 迁移 0.32 类型标注格式；原类型检查增加 `--all-defs`，覆盖未从入口调用的定义。
模板没有附带测试，完整 strict 和构建不代表所有图形交互已验收。

### Develop

Relies on [Calcit](http://calcit-lang.org/).

```bash
caps --strict --ci
corepack yarn install --immutable
caps verify --toolchain

calcit calcit.cirru js
yarn vite
```

### Workflow

https://github.com/Quatrefoil-GL/quatrefoil-workflow

本轮本地完整 strict、199 个定义及 9 个公开定义检查、严格依赖安装、工具链配对和构建通过。
页面场景、相机按键和刷新已验收；一次球体点击未取得派发的可观察证据，不宣称所有点击回调已验收。

### License

MIT
