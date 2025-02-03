@echo off
setlocal enabledelayedexpansion

set hexopath=D:\Github\Misaka-xxw.github.io
cd /d %hexopath%
if errorlevel 1 (
    echo 无法切换到指定目录，请检查路径是否正确！
    pause
    exit /b
)

:menu
echo.
echo 请选择要执行的操作：
echo.
echo [a] 所有文件名
echo [n] 创建新页面
echo [o] 打开md文件
echo [c] 清理 Hexo 项目 (npx hexo clean)
echo [g] 生成静态文件 (npx hexo g)
echo [s] 启动本地服务器 (npx hexo s)
echo [d] 部署到远程服务器 (npx hexo d)
echo [i] 自定义命令
echo [e] 退出
echo.

set /p choice="请输入选项："

if "%choice%"=="a" goto all page
if "%choice%"=="n" goto create_page
if "%choice%"=="o" goto open_page
if "%choice%"=="c" goto clean
if "%choice%"=="g" goto generate
if "%choice%"=="s" goto serve
if "%choice%"=="d" goto deploy
if "%choice%"=="i" goto custom_command
if "%choice%"=="e" goto end
echo 无效的选项，请重新输入！
pause
goto menu

:all page
cd source/_posts
dir /b *.md
cd ../..
pause
goto menu

:create_page
set /p pagename="请输入页面名字："
npx hexo new "%pagename%"
pause
goto menu

:open_page
set /p pagename="请输入页面名字："
start "" "%hexopath%\source\_posts\%pagename%.md"
pause
goto menu

:clean
echo 正在清理 Hexo 项目...
npx hexo clean
pause
goto menu

:generate
echo 正在生成静态文件...
npx hexo g
pause
goto menu

:serve
echo 正在启动本地服务器...
npx hexo s
pause
goto menu

:deploy
echo 正在部署到远程服务器...
npx hexo d
pause
goto menu

:custom_command
set /p custom_cmd="请输入自定义命令："
echo 正在执行命令: %custom_cmd%
%custom_cmd%
if errorlevel 1 (
    echo 命令执行失败！请检查命令。
)
pause
goto menu

:end
echo 脚本结束，感谢使用！
pause
exit /b
