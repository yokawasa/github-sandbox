
https://dev.to/dtinth/caching-docker-builds-in-github-actions-which-approach-is-the-fastest-a-research-18ei

https://github.com/dtinth/github-actions-docker-layer-caching-poc


```
➜  docker-cache git:(test-docker-layer-cache) ✗ docker build . -t myimage
➜  docker-cache git:(test-docker-layer-cache) ✗ docker tag myimage myimage-cache
➜  docker-cache git:(test-docker-layer-cache) ✗ docker save myimage-cache -o snapshot.tar
➜  docker-cache git:(test-docker-layer-cache) ✗ docker rmi myimage-cache
Untagged: myimage-cache:latest
➜  docker-cache git:(test-docker-layer-cache) ✗ docker rmi myimage
Untagged: myimage:latest
Deleted: sha256:c7d96a5f81577d6f4db521713f2424ab53f2a29e2e8bb9fd34d3ecb1c7d7c51f
Deleted: sha256:9c26d344c12fea1e6f896d2ffeaab8282b377b38875a0bddbd4fff0dbec30978
Deleted: sha256:23a0fcce73f5c71db1eddbf8026b6279196995af0d411819aaf41f835352b26d
Deleted: sha256:821febe9e8f1c48201788c0a315b790b4bc8b6f6e7c7855b6a53a383e800d89b
Deleted: sha256:613dd01434fe7f61aaa5aa532973e3a5499dacc7a366b2fd6fb314c53e15127a
Deleted: sha256:c3a3bceabca8d4fe40761af9062c8159f3ea1083aa40b413547e43aaef4bd1eb
Deleted: sha256:d676ee50ff507afb445ece89d13e9303b2aceb0a3d93ebee40f62368d1066469
Deleted: sha256:cd0303a858d594db2a9e6d42352bea57837a871ece2f9918c352474c0118ea3c
Deleted: sha256:53852811fdc82d1b4cfc0fc95b91acfb46cb48f8f5bd1181d2929775580c5f79
Deleted: sha256:0e2754b92a88a880b099c0a630e667a88058084c901d756a50ac513e347c098f
➜  docker-cache git:(test-docker-layer-cache) ✗ docker load -i ./snapshot.tar
6a40a487a873: Loading layer [==================================================>]  402.4MB/402.4MB
07cf5cc21483: Loading layer [==================================================>]  1.564MB/1.564MB
40407f11de32: Loading layer [==================================================>]    436MB/436MB
f35c1efb013f: Loading layer [==================================================>]  936.4kB/936.4kB
929e2d56a23a: Loading layer [==================================================>]  908.1MB/908.1MB
Loaded image: myimage-cache:latest
➜  docker-cache git:(test-docker-layer-cache) ✗  docker build . -t myimage --cache-from=myimage-cache
Sending build context to Docker daemon  2.696GB
Step 1/6 : FROM node:12
 ---> e163934eebb0
Step 2/6 : RUN yarn create react-app my-react-app
 ---> Using cache
 ---> c00cb908797a
Step 3/6 : RUN cd my-react-app && yarn build
 ---> Using cache
 ---> c8d2ebe98a93
Step 4/6 : RUN npm install -g @vue/cli && (yes | vue create my-vue-app --default)
 ---> Using cache
 ---> d3be4c580bf6
Step 5/6 : RUN cd my-vue-app && yarn build
 ---> Using cache
 ---> a0996b161326
Step 6/6 : RUN mkdir -p my-tests && cd my-tests && yarn add playwright
 ---> Using cache
 ---> c7d96a5f8157
Successfully built c7d96a5f8157
Successfully tagged myimage:latest
➜  docker-cache git:(test-docker-layer-cache) ✗
```

