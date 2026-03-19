
制作技能skill  创建项目目录结构如下

### 目录结构

```
projet /
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

你可以在IDE中测试这个技能，例如输入"创建一个C++项目结构"来触发它。

e:/AI-Skill/project  

请检查技能 project-structure-creator 是否严格按照目录结构创建目录 
目前测试下来  没有创建相关的目录 

创建一个C++项目结构 项目根目录为 Project2

请针对技能 project-structure-creator 生成技能说明文档和操作文档


技能描述  文档内容
文档	内容
SKILL_DOC.md	技能概述、功能特性、触发方式、配置选项、模板说明、常见问题
OPERATION.md	快速开始、操作示例、构建指南、自定义配置、故障排除

-----------------------

创建项目编译技能包  
技能包要求如下：

项目目录默认为 project

## windows 编译  
 
cd project/build
cmake .. -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release 
mingw32-make.exe -j8 

## linux 编译 
cd project/build
cmake .. -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release 
make -j8 

-----------------------

检查项目编译技能包 project-compiler 
要求不要添加环境变量 
window 使用  mingw 编译参数 参考  -G "MinGW Makefiles"
linux 使用 Unix Makefiles 编译参数参考 -G "Unix Makefiles"
目前windows环境  没有编译成功  请检查技能 project-compiler 是否严格按照上述要求编译项目 


3 
请针对技能 project-compiler 生成技能说明文档和操作文档



4) show 

使用 project-structure-creator 技能  项目根目录为 project3
build project3

5) 完善技能 project-structure-creator 
要求生成的目标在指定目录中 
├── build/                 # 构建输出目录
├── build/bin                 # 可执行文件目录
├── build/lib                 # 库输出目录

6）完善技能 project-structure-creator  要求使用c14以下

show
创建项目 project3 
build project3