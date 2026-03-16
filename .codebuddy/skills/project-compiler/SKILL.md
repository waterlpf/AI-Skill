---
name: project-compiler
description: 编译C++/CMake项目，支持Windows和Linux平台的编译命令，自动检测操作系统并执行对应的编译步骤
---

# Project Compiler

此技能用于编译C++/CMake项目，自动根据操作系统选择合适的编译命令。

## 使用场景

当用户需要编译C++/CMake项目时使用此技能：
- 编译C++项目
- 构建CMake项目
- 重新编译项目

## 默认项目目录

默认项目目录为 `project`（相对于当前工作区）

## 编译命令

### Windows 编译 (MinGW)

```batch
cd project/build
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release ..
mingw32-make -j8
```

### Linux 编译

```bash
cd project/build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release ..
make -j8
```

> **注意**: 如果遇到引号解析问题，可以创建批处理文件执行：
> ```batch
> @echo off
> cd /d %~dp0
> cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release ..
> mingw32-make -j8
> ```

## 执行步骤

1. **确认项目目录**：询问用户项目目录（默认为 `project`）

2. **检测操作系统**：自动检测当前操作系统（Windows/Linux）

3. **执行编译**：
   - Windows: 使用 MinGW Makefiles + mingw32-make
   - Linux: 使用 Unix Makefiles + make

4. **显示结果**：编译完成后显示结果信息

## 可选参数

- 项目目录路径
- 构建类型（Debug/Release）
- 编译线程数（-j参数）

## 错误处理

- 如果 build 目录不存在，先创建
- 如果 CMake 配置失败，显示错误信息
- 如果编译失败，提供调试建议
