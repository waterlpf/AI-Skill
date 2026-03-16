---
name: project-structure-creator
description: 创建标准的C++/CMake项目目录结构，包含src、include、tests、docs、config、build、scripts等目录及必要的配置文件
---

# Project Structure Creator

此技能用于快速创建标准的C++/CMake项目目录结构。

## 使用场景

当用户需要创建以下类型的项目目录结构时使用此技能：
- C++ 项目
- CMake 项目
- 需要标准目录布局的软件项目

## 目录结构模板

```
项目根目录/
├── src/                    # 源代码目录
│   ├── core/              # 核心模块
│   ├── utils/             # 工具类
│   ├── parsers/           # 解析器模块
│   └── main.cpp          # 主程序入口
├── include/               # 头文件目录
│   ├── core/              # 核心头文件
│   ├── utils/             # 工具类头文件
│   └── parsers/           # 解析器头文件
├── tests/                 # 测试代码目录
├── docs/                  # 项目文档
├── config/                # 配置文件目录
├── build/                 # 构建输出目录
├── scripts/               # 构建脚本
├── CMakeLists.txt         # 主构建文件
└── README.md              # 项目说明
```

## 执行步骤

1. **确认项目根目录**：询问用户项目创建的根目录位置（默认当前工作区）

2. **创建目录结构**：使用 write_to_file 工具创建所有必需的目录（通过创建空文件或占位文件的方式间接创建目录）

3. **创建必要文件**：
   - 创建 `CMakeLists.txt` 作为主构建文件
   - 创建 `README.md` 作为项目说明文件
   - 在 `src/` 下创建 `main.cpp` 主程序入口
   - 在各子目录下创建占位文件

4. **可选扩展**：根据用户需求添加其他文件或目录

## 输出示例

创建完成后，提供完整的目录树结构展示。
