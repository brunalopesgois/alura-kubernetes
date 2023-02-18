## Alura Kubernetes

### Pré requisitos
> Obs: Sistema operacional linux, não foi testado em outro sistema.

Docker: https://docs.docker.com/engine/install/ubuntu/

Kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

Kind: https://kind.sigs.k8s.io/docs/user/quick-start/

Helm: https://helm.sh/docs/intro/install/

### Subir ambiente trabalhado no curso
Importante alterar o o path de volumes do kind, no arquivo `kind-config.yaml` linha 7

```bash
sudo chmod +x init.sh
bash init.sh
```

> Obs: caso o port-foward não funcione, observar os pods (kubectl get pods) 
> e quando estiverem prontos, rodar os comandos da linha 26 e 28 do script init.sh

O portal de notícias está disponível no endereço:
**http://localhost:30000**

O sistema de notícias está disponível no endereço:
**http://localhost:30001**

Login e senha:
_admin_

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

### Teste de carga para observar o comportamento do hpa (horizontal pod scale):
```bash
sudo chmod +x stress.sh
bash stress.sh 0.001 > out.txt
kubectl get hpa --watch
```