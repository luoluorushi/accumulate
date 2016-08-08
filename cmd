1、chmod 777 xx.txt修改文件访问属性，rwx  owner，group，other
2、复制文件内容到粘贴板 pbcopy < ~/.ssh/id_rsa.pub
3、rm file删除文件， -f file强行删除，系统不提示。 -rf dir 删除整个目录
	rm -f *.log删除所有log文件
4、mkdir 创建文件夹
5、批量删除指定类型的文件 find . -name "*.xx" -exec rm -Rf {} \;分号要带，寻找.即是当前目录，下的所有xx结尾的文件，执行rm操作。
6、重命名  mv，重命名文件夹 mvdir
7、Finder里面实现剪切，w+c，w+alt+v
8、显示当前目录 echo $PWD
9、在当前目录查找指定文件名
	mdfind -onlyin . -name xxxx
