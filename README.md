# Curity Helm Chart Repository

This repository contains the Curity Identity Server helm chart source code. 

For more information on Curity and its capabilities, click [here](https://curity.io).

## How to Install the Chart

```console
$ helm repo add curity https://curityio.github.io/idsvr-helm/
$ helm repo update
$ helm install --name <release-name> curity/idsvr --set <option>=<value>
```

For mor information see the chart [README.md](/idsvr-helm/idsvr/README.md)


## More Information

Please visit [curity.io](https://curity.io/)  for more information about the Curity Identity Server.

Copyright (C) 2020 Curity AB.
