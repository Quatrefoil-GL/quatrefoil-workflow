
Quatrefoil Workflow
----

> Based on [Quatrefoil](https://github.com/Quatrefoil-GL/quatrefoil).

Demo http://r.tiye.me/Quatrefoil-GL/quatrefoil-workflow/

前端部署使用 COS Action 正式 v1.2.0 的 `public-base-url` 内置 verify，无额外校验脚本。
PR 的 COS/CDN 目录按编号/run/attempt 隔离，Vite base 与上传 prefix 同源；生产
`Quatrefoil-GL/quatrefoil-workflow/` 前缀与原 web-assets rsync 路径不变。
上传按事件/分支排队，job/上传分别限制为 15/10 分钟，现有类型门禁保留。
本轮仍使用 Calcit/procs 0.27.0，不代表已完成 0.28 类型迁移。

### Develop

Relies on [Calcit](http://calcit-lang.org/).

```bash
caps --ci
corepack yarn install --immutable
caps verify --toolchain

calcit calcit.cirru js
yarn vite
```

### Workflow

https://github.com/Quamolit/quatrefoil-workflow

### License

MIT
