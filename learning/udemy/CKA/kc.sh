# echo; kubectl get all -A -o wide
# echo; kubectl get all -A | grep -v kube-system
echo; kubectl -n ingress-space get all -o wide --no-headers
echo; kubectl -n app-space get all -o wide --no-headers
# echo; kubectl get namespace | grep -v 'kube-'
# echo; kubectl -n ingress-space get configmap,sa,roles,rolebindings
# echo; kubectl -n ingress-space get pod,deploy --show-labels
echo; kubectl get ingress -A 2> /dev/null
# echo; kubectl get ns | grep -v kube-
echo; kubectl -n app-space describe ingress 2> /dev/null
