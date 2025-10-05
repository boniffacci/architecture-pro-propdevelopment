kubectl create clusterrolebinding admin-binding \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:admin

kubectl create clusterrolebinding operator-binding \
  --clusterrole=cluster-operator \
  --serviceaccount=kube-system:operator

kubectl create clusterrolebinding viewer-binding \
  --clusterrole=view-only \
  --serviceaccount=kube-system:viewer
