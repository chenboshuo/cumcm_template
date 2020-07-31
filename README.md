# cumcm
我修改的数学建模国赛模板（分文件， 导入有用的库）

## 参考
[latexstudio
/
CUMCMThesis](https://github.com/latexstudio/CUMCMThesis)

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

## 目录结构与说明
```plain text
├── README.md   <---------------- 本文档
├── reference   <---------------- 参考文献文档，习惯把对应的PDF放到这里
│   └── reference.bib <---------- 参考文献的数据库(bib)
├── src  <----------------------- 代码，存放代码的文件夹
│   └── test.py <---------------- 单独的代码文件
└── thesis      <---------------- 论文文件夹
    ├── cumcmthesis.cls <-------- 模板文件
    ├── figures   <-------------- 图片文件夹，存放所有图片
    ├── main.pdf  <-------------- 论文PDF稿，每一小节的主题内容为对应的tex文件位置
    ├── main.tex <--------------- 论文代码
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
        └── question_review.tex <- 问题重述
```
## 其他参考与工具
-   [表格转化工具](https://www.tablesgenerator.com/)
-   [在线公式编辑转换](https://www.latexlive.com/##)
-   [overleaf latex document](https://www.overleaf.com/learn)

## 已知的问题

### 字体
win 和 linux字体名不一样
在`cumcmthesis.cls`找到如下内容（约183行）
```latex
% windowws 字体出现问题使用这一段设置
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}

% linux 字体出现问题使用这一段设置
% \setCJKfamilyfont{KaiTi}[AutoFakeBold]{simkai.ttf}
% \newcommand*{\kai}{\CJKfamily{kai}}
% \setCJKfamilyfont{SimSun}[AutoFakeBold]{SimSun}
% \newcommand*{\song}{\CJKfamily{song}}
```
