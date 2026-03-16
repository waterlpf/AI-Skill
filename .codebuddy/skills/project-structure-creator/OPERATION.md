# project-structure-creator 操作手册

## 快速开始

### 使用技能创建项目

1. **触发技能**
   - 直接告诉 AI："创建一个C++项目结构"
   - 或说："使用 project-structure-creator 技能"

2. **指定项目位置**
   - AI 会询问项目目录位置
   - 例如输入：`e:/AI-Skill/myproject`

3. **完成**
   - AI 会自动创建完整的项目结构

---

## 操作示例

### 示例1：基本使用

```
你：创建一个C++项目结构
AI：请问你要把项目创建在哪个目录？
你：e:/AI-Skill/demo
AI：（创建项目结构）
完成！项目已创建在 e:/AI-Skill/demo/
```

### 示例2：指定现有目录

```
你：创建一个C++项目结构，项目放在 e:/workspace/myproject
AI：（直接创建项目结构）
完成！
```

---

## 目录结构说明

| 目录 | 用途 |
|------|------|
| `src/` | 源代码文件 (.cpp) |
| `src/core/` | 核心业务逻辑 |
| `src/utils/` | 工具类函数 |
| `src/parsers/` | 解析器模块 |
| `include/` | 头文件 (.h/.hpp) |
| `include/core/` | 核心头文件 |
| `include/utils/` | 工具类头文件 |
| `include/parsers/` | 解析器头文件 |
| `tests/` | 单元测试代码 |
| `docs/` | 项目文档 |
| `config/` | 配置文件 |
| `build/` | 构建输出（可删除） |
| `scripts/` | 构建/部署脚本 |

---

## 构建项目

### 使用CMake构建

```bash
# 进入项目目录
cd e:/AI-Skill/demo

# 创建构建目录
mkdir build
cd build

# 配置项目
cmake ..

# 编译
cmake --build .

# 运行
./demo
```

### 使用Make构建

```bash
cd e:/AI-Skill/demo
mkdir build && cd build
cmake ..
make
./demo
```

---

## 自定义项目

### 修改项目名称

编辑 `CMakeLists.txt`：
```cmake
project(MyProject VERSION 1.0.0 LANGUAGES CXX)
```

### 修改C++标准

编辑 `CMakeLists.txt`：
```cmake
set(CMAKE_CXX_STANDARD 14)  # 改为 C++14
# 或
set(CMAKE_CXX_STANDARD 20)  # 改为 C++20
```

### 添加新的源文件目录

1. 在 `src/` 下创建新目录，如 `src/models/`
2. 编辑 `src/CMakeLists.txt`：
```cmake
add_subdirectory(models)
```

---

## 维护建议

### 清理构建目录

```bash
# Windows
rmdir /s /q build

# Linux/Mac
rm -rf build
```

### 更新README

编辑 `README.md`，添加项目特定信息：
- 项目描述
- 依赖项
- 使用说明
- 贡献指南

---

## 故障排除

### 问题：目录未创建

**解决方案**：确保提供完整的绝对路径，如 `e:/AI-Skill/project`

### 问题：CMake配置失败

**检查项**：
1. CMake 是否已安装？
2. C++ 编译器是否可用？
3. 路径是否包含中文或特殊字符？

### 问题：空目录未显示

**说明**：这是正常现象。技能会在每个目录中创建 `.gitkeep` 文件来确保目录被跟踪。

---

## 相关命令

### 触发技能的关键字

- "创建C++项目"
- "创建CMake项目"
- "项目结构"
- "C++脚手架"
- "project-structure-creator"
