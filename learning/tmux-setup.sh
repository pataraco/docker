set -o vi
alias kc=kubectl

echo "set -o vi" >> .profile
echo "alias kc=kubectl" >> .profile

tmux new-session -s rwh -n K8S \; split-window -h \;  split-window -h \; select-layout main-horizontal
