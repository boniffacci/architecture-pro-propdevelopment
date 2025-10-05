NAMESPACE="audit-zone"

echo "Проверка PodSecurity Admission..."
kubectl apply -f ../insecure-manifests/ -n $NAMESPACE
echo "Небезопасные поды должны быть отклонены"

echo "Проверка Gatekeeper..."
kubectl apply -f ../secure-manifests/ -n $NAMESPACE
echo "Безопасные поды должны пройти валидацию"

kubectl get pods -n $NAMESPACE
