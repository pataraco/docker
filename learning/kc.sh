kubectl get nodes -o wide # --no-headers
echo "---------------------------"
kubectl get pods -A -o wide # --no-headers
# kubectl get pods -o wide # --no-headers
echo "---------------------------"
#kubectl get deploy -A -o wide # --no-headers
kubectl get deploy -o wide # --no-headers
echo "---------------------------"
kubectl get all -o wide # --no-headers
kubectl get all -A -o wide # --no-headers
# echo "---------------------------"
# kubectl describe nodes | grep 'Name:' | tr '\n' '|'
echo
echo "---------------------------"
n=NODE
kubectl describe nodes $n | grep -A6 'Taints:'
# kubectl describe nodes $n | grep -A6 'Taints:' | tr '\n' '|'
echo
echo "---------------------------"
kubectl describe nodes $n | grep -A4 'Labels:'
# kubectl describe nodes $n | grep -A4 'Labels:' | tr '\n' '|'
echo

kubectl rollout status deploy frontend
kubectl rollout history deploy frontend

# kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info 2>&1` && echo "$test OK" || echo "$test Failed"';
