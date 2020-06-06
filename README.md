# cumcm
我修改的数学建模国赛模板（分文件， 导入有用的库）

## 参考
[latexstudio
/
CUMCMThesis](https://github.com/latexstudio/CUMCMThesis)

## 将模块中的模板类文件同步到最新
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
