@echo off
setlocal enabledelayedexpansion

set hexopath=D:\Github\Misaka-xxw.github.io
cd /d %hexopath%
if errorlevel 1 (
    echo �޷��л���ָ��Ŀ¼������·���Ƿ���ȷ��
    pause
    exit /b
)

:menu
echo.
echo ��ѡ��Ҫִ�еĲ�����
echo.
echo [a] �����ļ���
echo [n] ������ҳ��
echo [o] ��md�ļ�
echo [c] ���� Hexo ��Ŀ (npx hexo clean)
echo [g] ���ɾ�̬�ļ� (npx hexo g)
echo [s] �������ط����� (npx hexo s)
echo [d] ����Զ�̷����� (npx hexo d)
echo [i] �Զ�������
echo [e] �˳�
echo.

set /p choice="������ѡ�"

if "%choice%"=="a" goto all page
if "%choice%"=="n" goto create_page
if "%choice%"=="o" goto open_page
if "%choice%"=="c" goto clean
if "%choice%"=="g" goto generate
if "%choice%"=="s" goto serve
if "%choice%"=="d" goto deploy
if "%choice%"=="i" goto custom_command
if "%choice%"=="e" goto end
echo ��Ч��ѡ����������룡
pause
goto menu

:all page
cd source/_posts
dir /b *.md
cd ../..
pause
goto menu

:create_page
set /p pagename="������ҳ�����֣�"
npx hexo new "%pagename%"
pause
goto menu

:open_page
set /p pagename="������ҳ�����֣�"
start "" "%hexopath%\source\_posts\%pagename%.md"
pause
goto menu

:clean
echo �������� Hexo ��Ŀ...
npx hexo clean
pause
goto menu

:generate
echo �������ɾ�̬�ļ�...
npx hexo g
pause
goto menu

:serve
echo �����������ط�����...
npx hexo s
pause
goto menu

:deploy
echo ���ڲ���Զ�̷�����...
npx hexo d
pause
goto menu

:custom_command
set /p custom_cmd="�������Զ������"
echo ����ִ������: %custom_cmd%
%custom_cmd%
if errorlevel 1 (
    echo ����ִ��ʧ�ܣ��������
)
pause
goto menu

:end
echo �ű���������лʹ�ã�
pause
exit /b
