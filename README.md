I haven't worked on debugging part, So, no need to check for my debugging session.
i stopped because, 
i am using VSCode and WSL terminal, here i tried so many ways to install HELM but no luck, for previous parts 
i used git bash for HELM and the recording didn't work for git bash.
Recording Worked - WSL-YES, Git bash - NO 
HELM - WSL-Not able to install[My bad, i am not able to install], Git bash - installed

FOR REMAINING 

Required tools:

Docker
kind
kubectl
Helm
Run the setup

From the repository root:

bash ./setup.sh

Part 3
 ./setup.sh run this in gitbash in VSCode and run twice to check idempotency[For harness as well].
After pods run sucessfully, need to forward the port [kubectl -n ingress-nginx port-forward service/ingress-nginx-controller 8081:80]
then open another gitbash, run curl -H "Host: demo.local" http://localhost:8081/ to test ingress routing  [as previous used for port forwarding]