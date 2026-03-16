# project-structure-creator 技能说明文档

## 1. 技能概述

### 技能名称
`project-structure-creator`

### 技能描述
创建标准的C++/CMake项目目录结构，包含src、include、tests、docs、config、build、scripts等目录及必要的配置文件

### 技能类型
项目脚手架生成工具

---

## 2. 功能特性

### 2.1 目录结构生成
自动创建以下标准C++/CMake项目目录：

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

### 2.2 核心文件生成
- **CMakeLists.txt** - 主构建配置文件
- **src/main.cpp** - 程序入口文件
- **src/CMakeLists.txt** - 源代码构建配置
- **tests/CMakeLists.txt** - 测试配置
- **README.md** - 项目说明文档

### 2.3 目录占位文件
为确保空目录被版本控制系统跟踪，在每个子目录中创建 `.gitkeep` 文件。

---

## 3. 触发方式

### 自动触发
当用户请求以下内容时自动触发：
- "创建一个C++项目结构"
- "创建项目目录结构"
- "创建CMake项目"
- 其他语义相似的请求

### 手动触发
用户也可以显式调用技能：
```
使用 project-structure-creator 技能
```

---

## 4. 使用流程

### 步骤1：确认项目位置
技能会询问用户项目创建的根目录位置。

**示例对话：**
```
用户：创建一个C++项目结构
技能：请问你要把项目创建在哪个目录？（例如：e:/AI-Skill/myproject）
用户：e:/AI-Skill/project
```

### 步骤2：生成目录结构
技能会创建所有必需的目录和文件。

### 步骤3：确认完成
技能会展示完整的目录树结构供用户确认。

---

## 5. 配置选项

### 5.1 项目名称
技能会自动使用用户提供的目录名作为项目名称。

### 5.2 C++标准
默认使用 C++17 标准，可在生成的 CMakeLists.txt 中修改。

### 5.3 输出目录
- `build/` - 构建输出目录
- `bin/` - 可执行文件输出
- `lib/` - 库文件输出

---

## 6. 模板文件说明

### 6.1 CMakeLists.txt
```cmake
cmake_minimum_required(VERSION 3.10)
project(ProjectName VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)
add_subdirectory(src)
enable_testing()
add_subdirectory(tests)
```

### 6.2 main.cpp
```cpp
#include <iostream>

int main(int argc, char* argv[]) {
    std::cout << "Hello, World!" << std::endl;
    return 0;
}
```

---

## 7. 常见问题

### Q1: 如何修改C++标准？
A: 编辑生成的 CMakeLists.txt 文件，修改 `CMAKE_CXX_STANDARD` 的值。

### Q2: 如何添加新的源文件目录？
A: 在 `src/` 下创建新目录，并在 `src/CMakeLists.txt` 中添加 `add_subdirectory()`。

### Q3: 空目录为什么没有显示？
A: 技能会自动在每个空目录中创建 `.gitkeep` 文件，确保目录被版本控制跟踪。

### Q4: 如何查看完整的目录结构？
A: 使用 IDE 的文件树视图或执行 `find . -type d` 命令查看。

---

## 8. 技能文件结构

```
project-structure-creator/
├── SKILL.md              # 技能定义文件
├── SKILL_DOC.md          # 技能说明文档（本文件）
└── assets/               # 模板资源
    ├── CMakeLists.txt    # CMake模板
    ├── README.md         # README模板
    └── main.cpp          # 主程序模板
```

---

## 9. 更新日志

### v1.0.0 (2026-03-16)
- 初始版本
- 支持标准C++/CMake项目结构创建
- 自动生成核心配置文件
