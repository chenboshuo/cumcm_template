# cumcm
我修改的数学建模国赛模板

[![HitCount](http://hits.dwyl.com/chenboshuo/cumcm_template.svg)](http://hits.dwyl.com/chenboshuo/cumcm_template)
![GitHub repo size](https://img.shields.io/github/repo-size/chenboshuo/cumcm_template.svg)

[![wakatime](https://wakatime.com/badge/github/chenboshuo/cumcm_template.svg)](https://wakatime.com/badge/github/chenboshuo/cumcm_template)

## 说明
本项目的原模板是
[latexstudio
/
CUMCMThesis](https://github.com/latexstudio/CUMCMThesis)
本人做出以下改良

-   Linux 字体，兼容Linux, 原版没有字体
-   分文件，每一节都用子文件的形式，防止文件过长
-   导入有用的库：基本上我用过的都导入了
-   自动化脚本: Linux 和 Windows编写的脚本直接编译运行(Mac 应该可以用Linux的，没试过)

## 使用建议
### 建议使用`.gitignore` 用下面命令清理中间文件
```bash
git clean -fXd
```

### 使用snippets
尽量使用snippets减少固定操作
-   vscode
    -   [我的snippets](https://github.com/chenboshuo/fiddle/blob/master/my_config/latex.json)

-   atom
    -   [我的snippets](https://github.com/chenboshuo/fiddle/blob/master/my_config/snippets.cson)

### 使用子模块和软连接
这样可以用以下命令将模块中的模板类文件同步到最新
```bash
git submodule add git@github.com:chenboshuo/cumcm_template.git
ln -s cumcm_template/thesis/cumcmthesis.cls
git add .gitmodules cumcmthesis.cls
```
同步命令
```bash
git submodule update --recursive --remote
```
[reference](https://stackoverflow.com/questions/7597748/linking-a-single-file-from-another-git-repository)

## 使用脚本

### Linux
### 构建TODO版本
进入thesis 文件夹，运行
```bash
make todo
```
得到`build/todo.pdf`
该版本有todo便签指示文件夹的位置，
如不使用脚本，
编译时将`main.tex`第`5`行注释掉：
```latex
% \PassOptionsToPackage{disable}{todonotes} % 关闭todo标签
```

### 构建打印版本
```bash
make print
```
得到`build/print.pdf`,
这个版本的论文是用于打印的，
有前面的保证书页
**正式提交电子文件不要提交这个（因为含有个人信息）**


### 构建发布版本
```bash
make release
```
得到`build/release.pdf`
这个版本无todo标签，
无保证书页，
用来提交

以上两个版本若不使用脚本，
需要保留`main.tex`第`5`行，
即
```latex
\PassOptionsToPackage{disable}{todonotes} % 关闭todo标签
```

### 构建电子书版本
本模板提供电子书版本方便讨论交流时查看，
可能与其他版本有出入，
请勿正式提交
```bash
make ebook
```
或者将`main.tex`第`7`行注释，第`8`行加上ebook参数
```latex
% \documentclass{cumcmthesis} % 带封面的版本
\documentclass[withoutpreface,bwprint,ebook]{cumcmthesis} %去掉封面与编号页
```

### 构建全部版本
```bash
make
```
或
```bash
make all
```
可以同时得到以上四个版本

同时还有其他脚本可以用
```bash
make help
```
查看
```plt
make all       regenerate all results.
make todo      make build/todo.pdf
make release   make release version(without todo,cover) to build
make print     make print version(without todo) to build
make ebook     make the ebook version(with todo)
make *.pdf     generate the pdf files
make tree      update the file tree
make clean     clean the temp files
make build     create directory build
make help      show this message.
```

## Windows
保证有`powershell`

右键点击`thsis`的`make.ps1`运行


## 目录结构与说明
```plain text
├── README.md   <---------------- 本文档
├── reference   <---------------- 参考文献文档，习惯把对应的PDF放到这里
│   └── reference.bib <---------- 参考文献的数据库(bib)
├── src  <----------------------- 代码，存放代码的文件夹
│   └── test.py <---------------- 单独的代码文件
└── thesis      <---------------- 论文文件夹
    ├── build   <---------------- 用自动脚本生成的文件夹，存放多版本文件
    ├── cumcmthesis.cls <-------- 模板文件
    ├── figures   <-------------- 图片文件夹，存放所有图片
    ├── main.pdf  <-------------- 论文PDF稿，每一小节的主题内容为对应的tex文件位置
    ├── main.tex <--------------- 论文代码
    ├── makefile <--------------- Linux 对应自动化脚本，响应make命令
    ├── make.ps1 <--------------- powershell 脚本
    └── sections <--------------- 每一节的代码
        ├── abstract.tex <------- 摘要
        ├── analyse.tex <-------- 问题分析
        ├── assumptions.tex <---- 模型假设
        ├── flowchart_example.tex 一个tikz画的流图的例子
        ├── model_review.tex <--- 模型评价
        ├── notations.tex <------ 符号约定
        ├── q1_build.tex <------- 问题一模型建立
        ├── q1_solution.tex <---- 问题一模型求解
        ├── q2_build.tex
        ├── q2_solution.tex
        ├── q3_build.tex
        ├── q3_solution.tex
        ├── question_review.tex <- 问题重述
        ├── symbols_def.tex <- 用LaTex 定义的符号，也可以不使用该文件直接使用表格
        └── tree.txt <------------ 支撑材料目录结构，../src的目录树，两个脚本都可以自动生成
```

最好保留这些目录结构，
很多文件都是有相对路径的，
熟悉的话可以随便改
## 其他参考与工具
-   [表格转化工具](https://www.tablesgenerator.com/)
-   [在线公式编辑转换](https://www.latexlive.com/##)
-   [overleaf latex document](https://www.overleaf.com/learn)

## 已知的问题

### CTeX
  最好不要用，有些包没有，
  当然要是会安装，当我没说，
  如果不会安装，
  可以查找对应的`sty`文件放到thesis 目录里
