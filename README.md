# kubernetes-helm

Image providing [kubernetes](http://kubernetes.io/) tools `kubectl` and `helm`.

## Supported tags and respective `Dockerfile` links

- `latest` [Dockerfile](https://github.com/hypnoglow/docker-kubernetes-helm/blob/master/Dockerfile)
- `v2.6.1` [v2.6.0/Dockerfile](https://github.com/hypnoglow/docker-kubernetes-helm/blob/v2.6.1/Dockerfile)
- `v2.5.1` [v2.5.1/Dockerfile](https://github.com/hypnoglow/docker-kubernetes-helm/blob/v2.5.1/Dockerfile)

## Overview

The main purpose of this image is to use it in CI pipelines, e.g. to deploy an
application using `helm`.

For example, for [Gitlab CI](https://about.gitlab.com/features/gitlab-ci-cd/):

```yaml
...

deploy-staging:
  image: hypnoglow/kubernetes-helm
  stage: deploy
  before_script:
    - kubectl config set-cluster ${KUBE_NAME} ...
    - kubectl config set-credentials ${KUBE_USER} ...
    - kubectl config set-context ${KUBE_NAME}
        --cluster="${KUBE_NAME}"
        --user="${KUBE_USER}"
        --namespace="${KUBE_NAMESPACE}"
    - kubectl config use-context ${KUBE_NAME}
  script:
    - helm init --client-only
    - helm install release-name chart/name --namespace ${KUBE_NAMESPACE}

...
```

## License

[MIT](https://github.com/hypnoglow/docker-kubernetes-helm/blob/master/LICENSE).
