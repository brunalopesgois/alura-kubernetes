### Alura Kubernetes

### Comandos úteis

Listar recursos:
```bash
$ kubectl get pods/nodes/cluster/svc/rs/configmap/deployment
```
> Obs: usar a flag --watch permite acompanhar a mudança de estado do recurso em tempo real

Inspecionar recurso:
```bash
$ kubectl describe example-pod
```

Criar recurso a partir de arquivo:
```bash
$ kubectl apply -f ./example-pod.yaml
```

Deletar recurso a partir de arquivo:
```bash
$ kubectl delete -f ./example-pod.yaml
```

Cria uma anotação do que foi alterado no último deploy, semelhante a uma commit message do git:
```bash
$ kubectl annotate deployment example-deployment kubernetes.io/change-cause="Lorem ipsum"
```

Verifica histórico de anotações ou commits:
```bash
$ kubectl rollout history deployment example-deployment
```

Reverter deployment:
```bash
$ kubectl rollout undo deployment <nome do deployment> --to-revision=<versão a ser retornada>
```