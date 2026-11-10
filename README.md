
Quatrefoil Workflow
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Demo http://r.tiye.me/Quatrefoil-GL/quatrefoil-workflow/

前端部署使用 COS Action 正式 v1.2.0 的 `public-base-url` 内置 verify，无额外校验脚本。
PR 的 COS/CDN 目录按编号/run/attempt 隔离，Vite base 与上传 prefix 同源；生产
`Quatrefoil-GL/quatrefoil-workflow/` 前缀与原 web-assets rsync 路径不变。
上传按事件/分支排队，job/上传分别限制为 15/10 分钟，现有类型门禁保留。
### Calcit 0.40.0 使用说明

使用正式 Calcit 与 `@calcit/procs` 0.40.0，重新安装依赖并生成 JS。
示例点击通过 `DemoOp` 发送 `:demo` 或 `:canvas`，第二个参数是 `&unit`。
复制过旧点击回调的项目可以继续传原 Tag，新增业务操作时在 `updater` 里明确处理。
静态的 `comp-container` 无需传入 store。添加依赖状态的组件时，由应用传入具体的状态类型。

`SceneOp` 区分具名示例操作、旧 Tag 和 `List<Tag>` 游标。
直接游标和旧 `:states` pair 都继续走 Quatrefoil 的状态写入逻辑，
载荷由使用模板的项目决定，显式 nil 仍可存入。

### 历史配置

模板使用配套的正式 Calcit/procs 0.34.2，入口明确为 JS/browser。
采用已发布 Quatrefoil 0.3.0 的一致正式依赖图（Quaternion 0.2.19、
Pointed Prompt 0.0.24、Touch Control 0.0.36、JS FFI 0.2.9），不含 alpha/hash；
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

### 0.34.2 使用者影响与本轮验证

请同时升级 CLI/procs 0.34.2，重新运行 Caps 和不可变安装。Quatrefoil 0.3.0 的 Vec3Value
表示 union 继续支持 V3 或三项 Number 列表，长度错误现在明确拒绝；read-vec3 返回定长 Tuple。
模板全部 position 列表本来就是三项，示例源码、回调、HUD 和部署路径均未改变。
原开放 dispatch/状态入口仍保持，暂不把可扩展 Dynamic 强行收窄为不兼容的 union。

通过官方视图对照全部 9 个定义，代码、schema、测试和 FFI 元数据均保持不变；
calcit.cirru 字节也未变化。只更新工具链和正式模块版本，npm lock 仅 procs 条目变化。
原严格安装、工具链、200 个定义、9 个公开定义、完整 strict、全部原质量检查和构建通过，
dynamic-method/deprecated-call 均为 0。没有新增测试框架、脚本或门禁例外。

临时 Vite 内存验收使用实际 Three，核对 box、两球体、文字和两灯的位置/类型；
直接调用原三处回调，分别得到 :demo/nil、:canvas/nil、:canvas/nil。
这只证明场景数据和回调派发，未模拟鼠标命中或创建 WebGL 上下文；Vite WebSocket
绑定限制已记录，不把此结果当作浏览器视觉和交互验收。项目无原附着测试，不把空选择当测试通过。
最终 PR CI 与隔离 COS 内置校验待远端执行，本轮不合并或部署模板。

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

此前 0.32.1 本地完整 strict、199 个定义及 9 个公开定义检查、严格依赖安装、工具链配对和构建通过。
页面场景、相机按键和刷新已验收；一次球体点击未取得派发的可观察证据，不宣称所有点击回调已验收。

### License

MIT
