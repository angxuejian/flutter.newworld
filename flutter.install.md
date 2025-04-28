# Flutter 安装指南

国内使用Flutter只有两条路，配置镜像 or 配置代理


## Flutter SDK

1、下载 [Flutter SDK](https://docs.flutter.dev/release/archive)， 并解压，放至C盘任意位置，路径名称最好不要有```空格``` ```\_-.```等特殊符号

```bash
# good

C:\Users\username\flutter
```

```bash
# bad

C:\Users\User Name\flutter
```

2、添加环境变量，在path中添加```C:\Users\username\flutter\bin```，根据你的真实目录来设置

以上两步，就已经在本地环境中安装好Flutter SDK，下面请区分是```配置代理``` or ```配置镜像```来运行Flutter，二选一

## 配置代理

### Flutter 代理

在指定目录中创建```run.bat```文件，双击运行脚本即可，该目录下都会共享当前代理配置，由于```set```是临时设置，**关闭当前cmd窗口后就会清空配置**。如想配置长久代理，可以在**环境变量**中增加```http_proxy```、```https_proxy```

```bat
@echo off
set http_proxy=http://127.0.0.1:7890
set https_proxy=http://127.0.0.1:7890
set no_proxy=localhost,127.0.0.1,::1
cmd
```

查询命令
```bat
echo %http_proxy%
```

清空代理，默认关闭cmd窗口即可清空代理配置
```bat
set http_proxy=
```

### Android SDK 代理

1、下载 [Android Studio](https://developer.android.com/studio)，并安装

2、配置

在设置中``Appearance & Behavior`` > ```System Settings``` > ```HTTP Proxy```找到代理配置

选择```Manual proxy configuration```、```HTTP```。配置```Host name``` 和 ```Port number```即可。

代理配置成功后，重启 Android Studio，会弹出Android SDK、Android SDK Platform等包，下载即可。

3、检查

双击运行```run.bat```，使用 Flutter 来检查Android是否安装成功

```bat
Flutter doctor
```

运行完毕后，会告诉你是否安装成功，或者缺少哪些包。

缺少的包可以在```Android Studio```的设置 ```Languages & Frameworks``` > ```Android SDK```中下载

然后再使用```Flutter doctor```命令去检查。直到显示✅

4、运行

1. Android SDK 安装成功

2. Flutter Project 创建成功，[创建Flutter Project](#创建flutter-project)

3. 真机已开通```开发者选项```、```USB调试```、```启用MIUI优化：关闭```(小米手机特有)

在已创建的Flutter项目中找到```android``` > ```gradle.properties```文件中，添加代理配置

```properties
# HTTP 代理配置
systemProp.http.proxyHost=127.0.0.1
systemProp.http.proxyPort=7890
systemProp.https.proxyHost=127.0.0.1
systemProp.https.proxyPort=7890

# 忽略本地地址不走代理
systemProp.http.nonProxyHosts=localhost|127.0.0.1|::1
```

这时再次运行```flutter run```命令，即可在真机运行。

## 配置镜像

## 创建Flutter Project

1、创建
```cmd
flutter create your_project_name
```

2、运行

默认运作在```web```端；[```运行android```](#android-sdk-代理)端

```cmd
cd your_project_name

flutter run
```
