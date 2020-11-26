# ethereum2-docker-build

# Stereum Buildflow
For each Client we use a similar buildflow, building and pushing a "soft" image with packagemanager and with non breaking security scan (with the results available under /scan_results in the container), and creating a signed and (this time breaking) vulnerability scanned dockerfile.

![image](https://user-images.githubusercontent.com/54934211/100333196-96870200-2fd2-11eb-9b1e-d1722baaefc9.png)
