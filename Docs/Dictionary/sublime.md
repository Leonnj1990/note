#linux 下安装 sublimetext2 

##下载
	Sublime Text 2 的下载地址是 <a href="http://www.sublimetext.com/2">http://www.sublimetext.com/2</a>，如果你的 Linux 系统是64位的，
	那么别忘了下载64位的程序包，速度和性能都大不一样的。

##解压
	你可以使用 GUI 管理工具来解压，不过我更加推荐使用命令行工具。打开 Terminal < ctrl + alt + t >，首先进入存放下载程序包的文件夹：（假设是用户
	目录下的 Downloads 文件夹）

	~$ cd ~/Downloads/
	然后解压缩下载好的程序包：

	Downloads$ tar -xf Sublime\ Text\ 2.0.1\ x64.tar.bz2
	.tar.bz2 这样后缀名的文件可以当作类似于 Windows 下的 .zip 文件；\ 是转义字符，它的作用是把文件名中的空格做字符化处理，这样就不会被命令误当成
	是分隔符号了。

##运行
	进入解压缩后的文件夹，我们可以看到 Sublime Text 2 的组成文件，并且可以执行以下命令运行它：

	Sublime Text 2$ ./sublime_text
	不过还有两个问题值得注意：

	应用程序应该保存在什么特定的地方呢？
	首先，象 Ubuntu 这样的 Linux 系统并没有规定用户必须把应用程序保存在一个固定的地方，不过按照惯例通常有以下几个方案可供选择：

	保存在 /usr/lib/ 或 /usr/local/lib/ 文件夹下
	保存在 /opt/ 文件夹下
	保存在 ~/apps/ 或类似的用户自定义文件夹下
	这些方案都可以，重要的是养成一个习惯，不要到处乱丢就好。假设我们选择放在 /usr/local/lib 文件夹下，于是我们可以输入：

	Sublime Text 2$ cd ..
	Downloads$ mv Sublime\ Text\ 2 /usr/local/lib/
	为什么在运行的时候要在前面加上 ./ 呢？
	在 Linux 系统下，有一个环境变量叫做 $PATH ，系统在其中保存了一些可执行的二进制文件所存放的路径，因此我们可以在任何地方运行这些命令而不需要指定
	它们的绝对路径。

	你可以在任何情况下输入下面的命令来查看当前系统的 $PATH 环境变量：

	$ echo $PATH
	在之前的例子中，~/Downloads/Sublime Text 2/ 文件夹并不在 $PATH 环境变量之中，所以即使处于这个路径之下，也无法直接执行 sublime_text 这个命令，
	所以我们须要加一个 ./ （等同于当前目录）才可以。

	可是这么一来岂不是很麻烦？难道每安装一个应用程序，就得把它所处的文件夹路径添加到 $PATH 变量中去才能运行它吗？当然不是的。

	像 ls cd pwd 这样的命令，我们随时随地都可以运行，这是因为它们被统一存放在 /bin/ 或 /sbin/ 文件夹下，这些文件夹默认就在 $PATH 环境变量之中。同
	样的，/usr/bin/ 和 usr/sbin/ 也是如此。不过我们没有把 Sublime Text 2 的所有文件都放在这些文件夹下，这是因为它们不全是可执行的二进制文件。我们
	可以这么做：

	$ ln -s /usr/local/lib/Sublime\ Text\ 2/sublime_text /usr/bin/subl
	这条命令的意思就是给可执行的 sublime_text 文件创建了一个叫做 subl 的连接（类似 Windows 下的快捷方式，只不过是运行在命令行下的），并且把它保存
	在 /usr/bin/ 文件夹下。于是，我们就可以通过输入 subl 来运行 Sublime Text 2 了。

##简化
	通过上述操作，我们就安装好了 Linux 版本的 Sublime Text 2，不过相比 Windows 或 Mac OS X 而言，这还是太麻烦了。是否可以创建一个图形化的快捷方式
	以便我们在 Ubuntu 的 Dash 或 Launch Bar 里运行它呢？

	当然也是可以的啦！首先让我们进入一个文件夹：

	$ cd /usr/share/applications/
	在这里我们用 Sublime Text 2 创建一个文件：

	$ subl sublime.desktop
	.desktop 后缀的文件，就像是图形界面下的快捷方式，可以通过 Dash 搜索或运行它，也可以把它锁定在 Launch Bar 上。这个文件里需要输入的内容如下：

	[Desktop Entry]
	Version=1.0
	Name=Sublime Text 2
	GenericName=Text Editor

	Exec=subl
	Terminal=false
	Icon=/usr/local/lib/Sublime Text 2/Icon/48x48/sublime_text.png
	Type=Application
	Categories=TextEditor;IDE;Development
	X-Ayatana-Desktop-Shortcuts=NewWindow

	[NewWindow Shortcut Group]
	Name=New Window
	Exec=subl -n
	TargetEnvironment=Unity
	注意：第7行所指定的路径将决定快捷方式能否正确显示图标，请不要输错；第5行和第13行里的 subl 就是之前创建的那个连接，如果你创建的连接名字不一样，别
	忘了改正确。
