```bash
kubectl apply -f 01-create-namespace.yaml

kubectl apply -f insecure-manifests/ -n audit-zone

kubectl apply -f secure-manifests/ -n audit-zone

kubectl get constrainttemplates
kubectl get constraints --all-namespaces

bash verify/verify-admission.sh
bash verify/validate-security.sh

kubectl apply -f audit-policy.yaml