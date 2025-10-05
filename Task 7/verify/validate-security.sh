NAMESPACE="audit-zone"

echo "Список всех подов в $NAMESPACE:"
kubectl get pods -n $NAMESPACE

echo "Проверка на запрещённые privileged контейнеры:"
kubectl get pods -n $NAMESPACE -o json | jq '.items[] | {name: .metadata.name, privileged: .spec.containers[].securityContext.privileged}'

echo "Проверка на hostPath:"
kubectl get pods -n $NAMESPACE -o json | jq '.items[] | {name: .metadata.name, volumes: .spec.volumes[]} | select(.volumes.hostPath != null)'

echo "Проверка runAsNonRoot и readOnlyRootFilesystem:"
kubectl get pods -n $NAMESPACE -o json | jq '.items[] | {name: .metadata.name, runAsNonRoot: .spec.containers[].securityContext.runAsNonRoot, readOnlyRootFilesystem: .spec.containers[].securityContext.readOnlyRootFilesystem}'
