# project-compiler 技能说明文档

## 1. 技能概述

### 技能名称
`project-compiler`

### 技能描述
编译C++/CMake项目，支持Windows和Linux平台的编译命令，自动检测操作系统并执行对应的编译步骤

### 技能类型
项目编译工具

---

## 2. 功能特性

### 2.1 跨平台编译
- **Windows**: 使用 MinGW Makefiles + mingw32-make
- **Linux**: 使用 Unix Makefiles + make

### 2.2 自动检测
- 自动检测当前操作系统类型
- 自动选择合适的编译工具链

### 2.3 构建类型支持
- Debug (调试版本)
- Release (发布版本，默认)

### 2.4 并行编译
- 默认使用 8 线程编译 (-j8)
- 可自定义线程数

---

## 3. 编译命令

### Windows (MinGW)

```batch
cd project/build
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release ..
mingw32-make -j8
```

### Linux

```bash
cd project/build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
make -j8
```

---

## 4. 触发方式

### 自动触发
当用户请求以下内容时自动触发：
- "编译项目"
- "编译C++"
- "构建项目"
- "build project"
- 其他语义相似的请求

### 手动触发
```
使用 project-compiler 技能
```

---

## 5. 使用流程

### 步骤1：确认项目目录
技能会询问用户项目目录（默认为 `project`）

### 步骤2：检测系统
自动检测操作系统类型

### 步骤3：执行编译
按照对应平台的命令执行编译

### 步骤4：显示结果
编译完成后显示结果信息

---

## 6. 脚本说明

### build.bat / build.sh
主编译脚本

**参数：**
| 参数 | 说明 | 默认值 |
|------|------|--------|
| 1 | 项目目录 | project |
| 2 | 构建类型 | Release |
| 3 | 编译线程数 | 8 |

**使用示例：**
```bash
# Windows - 使用默认参数
call build.bat

# Windows - 指定项目目录
call build.bat myproject

# Windows - 指定项目目录和构建类型
call build.bat myproject Debug

# Linux - 使用默认参数
./build.sh

# Linux - 指定项目目录和构建类型
./build.sh myproject Debug
```

### clean.bat / clean.sh
清理构建目录脚本

**使用示例：**
```bash
# 清理默认项目
./clean.sh

# 清理指定项目
./clean.sh myproject
```

---

## 7. 常见问题

### Q1: 编译失败怎么办？
A: 检查以下内容：
- CMake 是否已安装
- MinGW/GCC 是否可用
- 源代码是否有语法错误
- 编译器路径是否正确

### Q2: 如何编译Debug版本？
A: 指定构建类型为 Debug：
```bash
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug ..
mingw32-make -j8
```

### Q3: 如何加快编译速度？
A: 增加并行线程数：
```bash
mingw32-make -j16    # 16线程
make -j$(nproc)      # 使用所有CPU核心
```

### Q4: CMake 找不到 MinGW 生成器
A: 这是某些环境的已知问题。解决方案：
1. 创建批处理脚本执行编译
2. 在系统终端中执行命令

---

## 8. 技能文件结构

```
project-compiler/
├── SKILL.md          # 技能定义
├── SKILL_DOC.md      # 说明文档（本文件）
├── OPERATION.md      # 操作手册
└── assets/           # 编译脚本
    ├── build.bat     # Windows编译
    ├── build.sh     # Linux编译
    ├── clean.bat    # Windows清理
    └── clean.sh     # Linux清理
```

---

## 9. 编译输出

编译成功后，可执行文件通常位于：
- Windows: `project/build/src/ProjectName.exe`
- Linux: `project/build/src/ProjectName`

---

## 10. 更新日志

### v1.0.0 (2026-03-16)
- 初始版本
- 支持Windows和Linux编译
- 提供编译和清理脚本
- 使用 -G "MinGW Makefiles" 和 -G "Unix Makefiles" 参数
