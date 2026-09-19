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


- the resource requests and limits you chose, and **why** those numbers
I want to be genuine, I have just used base or default values, which AI gave me, not the values i have assumed.

- what you would change to make this production-ready
1. The image should be in docker hub
2. We can use jenkins or Github action, to automate most of the things
3. Need to use secret manager to store sensitive information
4. Use HPA/VPA for autoscaling
5. Set up monitoring for logging, metrics, alerting etc.


- **How I used AI** (see policy above)
Yamls, .sh and the values[resource requests and limits] - mostly AI and part me
Docker file - Part me and part AI
Commands to run, execute etc. - Part me and part AI
Git - Mostly me still AI is there
Debugging - me and AI struggled but no luck.
Debugging means what i except, how to debug CrashLoopBackOff, ErrImagePull, ImagePullBackOff, etc, but this is out of my league.
