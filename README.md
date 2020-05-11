# Curity Helm Chart Repository

[![Quality](https://curity.io/assets/images/badges/idsvr-helm-quality.svg)](https://curity.io/resources/code-examples/status/)
[![Availability](https://curity.io/assets/images/badges/idsvr-helm-availability.svg)](https://curity.io/resources/code-examples/status/)

This repository contains the Curity Identity Server helm chart source code. 

For more information on Curity and its capabilities, click [here](https://curity.io).

## How to Install the Chart

```console
$ helm repo add curity https://curityio.github.io/idsvr-helm/
$ helm repo update
$ helm install --name <release-name> curity/idsvr --set <option>=<value>
```

For more details see the chart [README.md](/idsvr/README.md)


## More Information

Please visit [curity.io](https://curity.io/)  for more information about the Curity Identity Server.

Copyright (C) 2020 Curity AB.
