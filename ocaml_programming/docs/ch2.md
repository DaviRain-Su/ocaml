# 2.2.3.1.手动创建沙丘项目

创建一个dune的文件 `dune`，并在其中添加以下内容：

```dune
(executable
 (name hello))
```

它声明了一个可执行文件（可以执行的程序），其主文件是 hello.ml 。

另外创建一个名为 dune-project 的文件，并将以下内容放入其中：

```dune
(lang dune 3.14)
```

您想要使用 Dune 编译的每个源代码树的根目录中都需要此项目文件。一般来说，源树的每个子目录中都会有一个 dune 文件，但根目录下只有一个 dune-project 文件。

现在，您可以在项目的根目录中创建一个名为 hello.ml 的文件，并将以下内容放入其中：

```ocaml
let () = print_endline "Hello, world!"
```

然后终端运行

```shell
dune build hello.exe
```

请注意， .exe 扩展名在 Dune 的所有平台上使用，而不仅仅是在 Windows 上。这会导致 Dune 构建本机可执行文件而不是字节码可执行文件。

Dune 将创建一个目录 _build 并在其中编译我们的程序。这是构建系统相对于直接运行编译器的好处之一：它们不会用一堆生成的文件污染源目录，而是在单独的目录中干净地创建它们。 _build 内部有许多由 Dune 创建的文件。我们的可执行文件被埋藏在下面几层：

```shell
_build/default/hello.exe
Hello, world!
```

也可以直接运行

```shell
dune exec ./hello.exe
Hello world!
```

清理🧹代码

```shell
dune clean
```

这将删除 _build 目录，只留下源代码。

> 不要编辑 _build 目录中的任何文件。如果您在尝试保存只读文件时遇到错误，则您可能正在尝试编辑 _build 目录中的文件。

## 2.2.3.2.自动创建沙丘项目

Dune 还可以为您创建项目。在项目的根目录中运行以下命令：

```shell
$ dune init project calculator
$ cd calculator
$ code .
```

这将创建一个名为 calculator 的目录，其中包含一个名为 dune-project 的文件和一个名为 dune 的文件。这两个文件的内容与我们在上一节中手动创建的内容相同。

```shell
$ dune exec bin/main.exe
```

它将打印 Hello, World!
