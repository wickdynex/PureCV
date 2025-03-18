# PureCV

**PureCV** 是一款基于 XeLaTeX 引擎的现代化简历模板，支持生成高质量 PDF 简历。它支持多语言（目前为英文和中文），并内置字体，无需额外安装字体或工具。项目使用 `make` 工具实现自动化编译与清理，并包含 `watch_tex.sh` 脚本，可在 `.tex` 文件变化时自动重建简历。

## 预览

### 带图片的标题

[图片预览]

### 无图片的标题

[图片预览]

## 功能特性

- **多语言支持**：模板同时支持英文和中文，并包含定制字体。
- **内置字体**：集成了 Lato 和思源黑体（用于中文字符），字体文件已随项目打包。
- **两种标题样式**：
  - **基础标题**：无图片的简洁版本。
  - **完整标题**：标题中包含图片。
- **自动化构建流程**：项目包含 `Makefile`，通过 `make` 命令即可自动编译和清理。
- **实时构建**：`watch_tex.sh` 脚本可监控 `.tex` 文件变化并自动重建简历。

## 安装指南

使用 **PureCV** 前，请先克隆项目到本地：

git clone https://github.com/wickdynex/PureCV.git

确保系统已安装 **XeLaTeX**。根据操作系统选择安装方式：

- **Linux** (Debian/Ubuntu):

```bash
sudo apt-get install texlive-xetex
```

- **macOS** (通过 Homebrew):

```bash
brew install --cask mactex
```

- **Windows**：可安装 **MiKTeX** 或 **TeX Live**。

### 依赖项

- **XeLaTeX**：用于将 `.tex` 文件编译为 PDF。
- **Make**：确保系统已安装 `make` 工具（Unix 系统通常预装）。
- **字体文件**：所需字体文件已包含在 `font/` 目录中。

## 使用方法

### 构建简历

生成 PDF 简历的步骤：

1. 打开终端，进入项目目录。
2. 运行 `make` 命令构建简历。

```bash
make
```

生成的 `resume.pdf` 文件将保存在项目目录中。

### 清理构建文件

如需清理构建过程中生成的临时文件：

```bash
make clean
```

### 监控文件变化

若需在 `.tex` 文件变化时自动重建简历，可使用 `watch_tex.sh` 脚本：

./watch_tex.sh

该脚本会监控 `resume/` 目录下的 `.tex` 文件，并在文件变化时自动重新构建。

## 个性化定制

您可通过修改以下内容定制简历：

- **个人信息**：在 `resume.tex` 文件中更新姓名、联系方式等个人资料。

- **简历内容**：修改 `src/` 目录下的内容模块（如 `achievements.tex`、`education.tex`）。
- **标题样式**：通过在 `resume.tex` 中包含对应文件（`heading_basic.tex` 或 `heading.tex`）选择基础或完整标题样式。

## 许可证

本项目采用 MIT 许可证。详情请见 [LICENSE](LICENSE) 文件。

## 灵感来源

本项目受 [Resume Template](https://github.com/aserador/resume-template) 项目启发。我们进行了定制和增强，以更好地支持多语言、内置字体和自动化构建功能。感谢原项目作者对开源社区的贡献！

### 注意事项

- **字体**：项目中使用的字体（Lato 和思源黑体）已随项目打包，无需额外安装。
- **跨平台兼容性**：项目设计为可在 Linux、macOS 和 Windows 系统上无缝运行。