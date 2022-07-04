# RecognizeHTTPS
大三編譯器期末專案
---
### 使用.l檔（找出文章中的https合法網址）

```
make
```
---
### 使用.y檔（判斷輸入的字串是否為https合法網址）
```
flex word-spliter.l
bison -d word-spli.y
gcc word-spli.tab.c lex.yy.c -lfl          (-lfl在MacOS中移除)
```
