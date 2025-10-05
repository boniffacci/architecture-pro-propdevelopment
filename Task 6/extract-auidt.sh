#!/bin/bash

AUDIT_LOG="./audit.log"
OUTPUT_JSON="./audit-extract.json"

> "$OUTPUT_JSON"

jq 'select(.objectRef.resource=="secrets" and .verb=="get")' $AUDIT_LOG >> $OUTPUT_JSON

jq 'select(.objectRef.resource=="pods" and .requestObject.spec.containers[].securityContext.privileged==true)' $AUDIT_LOG >> $OUTPUT_JSON

jq 'select(.verb=="create" and .objectRef.subresource=="exec")' $AUDIT_LOG >> $OUTPUT_JSON

jq 'select(.objectRef.name=="audit-policy.yaml")' $AUDIT_LOG >> $OUTPUT_JSON

jq 'select(.objectRef.resource=="rolebindings" and .requestObject.roleRef.name=="cluster-admin")' $AUDIT_LOG >> $OUTPUT_JSON

echo "Фильтрация завершена. Вывод сохранён в $OUTPUT_JSON"
