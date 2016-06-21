命令行打包android jar包文件：
1、将要编译的所有javac文件输入到sources.list find src -name *.java > sources.list
2、javac编译命令, javac -target 1.7 -bootclasspath /users/luoluorushi/documents/android-4.4.2/android.jar -cp libs/wup.jar:libs/mta-omg-sdk-2.0.5.jar:libs/videoad-sdk-1.1.9-mini.jar:libs/unityjar.jar @sources.list -Xlint:deprecation -Xlint:unchecked -d class 。其中-cp指定依赖的jar包，使用冒号分割
3、将所有class文件打包成jar包，jar cvf VideoSdk.jar .  显示包内容则为 jar tvf VideoSdk.jar
二、android studio提示无法导入 org.apache.http，在module的build.gradle，android条目下增加useLibrary 'org.apache.http.legacy'

三、只有java源文件，如何创建android studio工程
新建工程，将源代码复制到src目录下，将libs文件复制到app目录下；
删除系统生成的其他java文件；
修改app的build.gradle，apply plugin 'com.android.library'；sourceSets { main { java.srcDirs = ['src'] } }；
删除main目录下AndroidManifest.xml application标签的applicationid项

四、Android Studio生成jar包，在模块的build.gradle文件末尾增加如下
VideoSdktask makeJar(type: Copy) {
    delete 'build/libs/VideoSdk.jar'
    from('build/intermediates/bundles/debug/')
    into('build/libs/')
    include('classes.jar')
    rename ('classes.jar', 'VideoSdk.jar')
}

// This is the actual solution, as in http://stackoverflow.com/a/19037807/1002054
task clearJar(type: Delete) {
    delete 'build/libs/VideoSdk.jar'
}

makeJar.dependsOn(assembleRelease)
在终端，工程目录下面执行 gradle makeJar
