Firstly, i will check the existing, how everything is working and rate the application according to the risk
then i will check TLS certificates, authentication, and any ingress-nginx and so many another things for the existing.
Then, i will create the production ready gateway, then , here also i will check the TLS certificates, authentication, and any ingress-nginx and so many another things.
Then, once every thing is reviewed, I create a Gateway with listeners for HTTP/HTTPS and as mentioned above rating, i will route traffic with small risk to the new gateway.
I would test routing, health checks, authentication and other behaviors. I will also keep an eye on load balancer, observability, logging, metrics.
Once, every thing is good, i will migrate the traffic in batches, if not good, will prepare for roll back measures.
Here, we wont touch old one un till every routing is routed to new one.