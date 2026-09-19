 ./setup.sh run this in gitbash in VSCode and run twice to check idempotency[For harness as well].
After pods run sucessfully, need to forward the port [kubectl -n ingress-nginx port-forward service/ingress-nginx-controller 8081:80]
then open another gitbash, run curl -H "Host: demo.local" http://localhost:8081/ to test ingress routing  [as previous used for port forwarding]