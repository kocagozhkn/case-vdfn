CI/CD SPRING BOOT PIPELINE PROJECT

In this project we will build spring boot hello world app, with jenkins then deploy to k8s cluster which is based on AWS platform. When jenkins build triggered it will download source code from github link and build it and create artifact which is a jar file, after second phase docker will build docker image according to Dockerfile, when the build finishes third phase will begin taggin and pushing image to DockerHub. Last phase is kubernetes deploy, with deployment files jenkins will apply kubernetes deployment and trigger a rollout to push kubernetes new image from Hub.

Prequerities:

- Kubernetes cluster: Two ec2 machine t3a.medium, one of master, other is worker node, images are both ubuntu 20.04.
- Jenkins Server: single ec2 machine type t2.medium image ubuntu 20.04, these jenkins plugins must be configured. Docker, Docker Pipeline, Maven, Git, Kubectl. Also the kubeconfig file must be placed at /var/lib/jenkins/.kube/config to deploy the kubernetes cluster.
- Docker Hub: We will use a free tier public repository for the project.

General View Of Project

![](/imgs/AWS.PNG)

AWS Instance View ![](/imgs/ec2_list.PNG)

AWS Load Balancer

![](/imgs/alb.PNG)


Route53

![](/imgs/route53.PNG)

When the client type browser [www.hakankocagoz.com](http://www.hakankocagoz.com/) , aws route53 will send that request to load balancer, loadbalancer took that request and sent it to kubernetes nodeport tcp:30055, ingress will check the request path and related service will respond to request.

Pipeline / Declarative

![](/imgs/jenkins.PNG)

Pipeline has 6 stages:

1. Stage: Declaration of tools that we use in stages.
2. Stage: Git checkout, choose which branch to build.
3. Stage: Build source code with maven according to POM.xml
4. Stage: Build docker image with artifact which comes from maven build stage.
5. Stage: Tag docker image and push to Docker HUB.
6. Stage: Kubernetes deployment and trigger redeployment to take a newer image.

![](/imgs/pipeline.PNG)

Docker HUB

![](/imgs/hub.PNG)