rem See gist at https://gist.github.com/mkoertgen/c18945611c5b74c73878263d44043d99
@echo off
setlocal

rem http://blog.yohanliyanage.com/2015/05/docker-clean-up-after-yourself/

rem 1. Make sure that exited containers are deleted.
for /f "usebackq delims==" %%a in (`docker ps -aq`) do docker rm -v %%a

rem 2. Remove unwanted ‘dangling’ images.
for /f "usebackq delims==" %%a in (`docker images -f "dangling=true" -q`) do docker rmi %%a

rem 3. Still not enough space? What is this ‘vfs’ directory?
for /f "usebackq delims==" %%a in (`docker volume ls -qf "dangling=true"`) do docker volume rm %%a

rem Can be run as Scheduled Task if you want
endlocal
