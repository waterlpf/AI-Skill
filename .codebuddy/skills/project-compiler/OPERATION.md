# project-compiler 操作手册

## 快速开始

### 使用技能编译项目

1. **触发技能**
   - 直接告诉 AI："编译项目"
   - 或说："使用 project-compiler 技能"
   - 或说："build project"

2. **确认项目目录**
   - AI 会询问项目目录（默认为 `project`）

3. **完成**
   - AI 会自动执行编译并显示结果

---

## 操作示例

### 示例1：编译默认项目

```
你：编译项目
AI：请问项目目录是？（默认为 project）
你：project
AI：（执行编译）
编译完成！
```

### 示例2：编译指定项目

```
你：编译 e:/AI-Skill/Project2
AI：（直接执行编译）
编译完成！
```

---

## 手动执行编译

### Windows (CMD/PowerShell)

```batch
cd project/build
cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release
mingw32-make -j8
```

### Linux (Terminal)

```bash
cd project/build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release
make -j8
```

---

## 使用脚本编译

### Windows

```batch
# 复制脚本到项目目录
copy assets\build.bat project\build\

# 进入构建目录
cd project\build

# 编译（使用默认参数）
call build.bat

# 或指定参数
call build.bat project Release 8
```

### Linux

```bash
# 添加执行权限
chmod +x build.sh clean.sh

# 编译（使用默认参数）
./build.sh

# 指定项目目录和构建类型
./build.sh project Release

# 指定线程数
./build.sh project Release 16
```

---

## 构建类型

| 类型 | 说明 | 适用场景 |
|------|------|----------|
| Release | 优化版本 | 生产环境发布 |
| Debug | 调试版本 | 开发调试 |

---

## 编译输出

编译成功后，可执行文件位置：

| 平台 | 路径 |
|------|------|
| Windows | `project/build/src/ProjectName.exe` |
| Linux | `project/build/src/ProjectName` |

---

## 运行程序

### Windows

```batch
project\build\src\ProjectName.exe
```

### Linux

```bash
./project/build/src/ProjectName
```

---

## 清理构建

### Windows

```batch
# 方式1: 使用脚本
call clean.bat project

# 方式2: 手动删除
rmdir /s /q project\build
```

### Linux

```bash
# 方式1: 使用脚本
./clean.sh project

# 方式2: 手动删除
rm -rf project/build
```

---

## 故障排除

### 问题：CMake 找不到 MinGW 生成器

**错误信息：**
```
CMake Error: Could not create named generator "MinGW Makefiles"
```

**解决方案：**
1. 使用批处理脚本执行编译
2. 确保 MinGW 已正确安装

### 问题：CMake 找不到编译器

**解决方案**：确保已安装 MinGW (Windows) 或 GCC (Linux)

### 问题：mingw32-make 不是内部命令

**解决方案**：确保 MinGW 已添加到系统 PATH

### 问题：编译卡住

**解决方案**：按 Ctrl+C 取消，检查源代码错误

### 问题：引号解析错误

**错误信息：**
```
'\"MinGW Makefiles\"' 不是内部或外部命令
```

**解决方案**：
- 使用批处理脚本 (.bat) 而非命令行
- 在 VS Code 终端或系统终端中执行

---

## 编译参数说明

### cmake 参数

| 参数 | 说明 | 示例 |
|------|------|------|
| -G | 指定生成器 | `-G "MinGW Makefiles"` |
| -DCMAKE_BUILD_TYPE | 构建类型 | `-DCMAKE_BUILD_TYPE=Release` |
| -S | 源码目录 | `-S e:/AI-Skill/project` |
| -B | 构建目录 | `-B e:/AI-Skill/project/build` |

### make 参数

| 参数 | 说明 | 示例 |
|------|------|------|
| -j | 并行线程数 | `-j8` |
| -n | 试运行 | `-n` |
| VERBOSE | 详细输出 | `VERBOSE=1` |

---

## 相关命令

### 触发技能的关键字

- "编译"
- "编译项目"
- "构建"
- "build"
- "make"
- "project-compiler"

---

## 工作流程

```
1. 创建项目结构 (project-structure-creator)
       ↓
2. 编写源代码
       ↓
3. 编译项目 (project-compiler)
       ↓
4. 运行程序
```

---

## 技能文件位置

```
e:/AI-Skill/.codebuddy/skills/project-compiler/
├── SKILL.md          # 技能定义
├── SKILL_DOC.md      # 技能说明
├── OPERATION.md      # 操作手册
└── assets/           # 脚本文件
    ├── build.bat     # Windows编译
    ├── build.sh      # Linux编译
    ├── clean.bat     # Windows清理
    └── clean.sh      # Linux清理
```
