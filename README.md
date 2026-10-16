
Quatrefoil Workflow
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Demo http://r.tiye.me/Quatrefoil-GL/quatrefoil-workflow/

前端部署使用 COS Action 正式 v1.2.0 的 `public-base-url` 内置 verify，无额外校验脚本。
PR 的 COS/CDN 目录按编号/run/attempt 隔离，Vite base 与上传 prefix 同源；生产
`Quatrefoil-GL/quatrefoil-workflow/` 前缀与原 web-assets rsync 路径不变。
上传按事件/分支排队，job/上传分别限制为 15/10 分钟，现有类型门禁保留。
模板使用配套的正式 Calcit/procs 0.30.0，入口明确为 JS/browser。
采用已发布 Quatrefoil 0.1.8 的一致正式依赖图（Quaternion 0.2.14、
Pointed Prompt 0.0.19、Touch Control 0.0.31、JS FFI 0.2.3），不含 alpha/hash；
控制器样式直接来自同一 Caps 模块，不再额外安装旧 npm 控制器。
组件返回具体 Component，事件回调声明 Unit dispatch 合同；
使用 defref/watch!/match，移除未使用的 portal/tab 状态读取和 getter。
示例的点击操作与场景内容保持不变，不新增验证脚本或测试框架。
环境变量和 canvas 读取使用 Option 接收者方法，缺省 release 和缺少 canvas
时的失败行为不变；移除旧单版本安装预批准，使用正常包龄策略。
现有开放状态边界仍保留；正式 0.30.1 发布后仍需配对升级和完整验收。

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

### License

MIT
