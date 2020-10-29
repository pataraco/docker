set -o vi
alias kci='kubectl -n ingress-space'
complete -F __start_kubectl kci
#tmux
#tmux resize-pane -R 5
kubectl create ns ingress-space
kci create configmap nginx-configuration
kci create serviceaccount ingress-serviceaccount
cp ingress-controller.yaml{,.orig}
vi ingress-controller.yaml
kci apply -f ingress-controller.yaml
vi svc-ingress.yaml
kci apply -f svc-ingress.yaml
