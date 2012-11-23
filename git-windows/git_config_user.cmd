@color 0a
@set path=%path%;"C:\Program Files\Git\cmd"
@git config --global http.proxy "172.21.8.8:8080"
@git config --global alias.ci "commit"
@git config --global alias.co "checkout"
@git config --global alias.br "branch"
@git config --global alias.lg "log --graph --oneline"

git config --global --list

pause
