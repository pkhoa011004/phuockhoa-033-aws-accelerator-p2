# T4 - D3 Canary Deployment voi Argo Rollouts

## Muc tieu

Hieu progressive delivery:

```text
Version moi
  -> 20% traffic
  -> pause va kiem metric
  -> 50% traffic
  -> pause va kiem metric
  -> 100% traffic
```

Neu metric xau, rollout bi abort va rollback thay vi day loi cho 100% user.

## File da setup

- `service/web-services.yaml`: service expose app web. Basic canary se chia traffic bang ti le pod; traffic router nhu Istio/NGINX co the them sau.
- `analysis-template/web-success-rate.yaml`: metric gate doc Prometheus.
- `rollout/web-rollout.yaml`: Rollout thay cho Deployment.

## Lenh thuc hanh goi y

```bash
kubectl create namespace w9
kubectl apply -f Cloud-DevOps/W9/day-c/service/web-services.yaml
kubectl apply -f Cloud-DevOps/W9/day-c/analysis-template/web-success-rate.yaml
kubectl apply -f Cloud-DevOps/W9/day-c/rollout/web-rollout.yaml
kubectl get rollout -n w9
```

Cai Argo Rollouts neu cluster chua co CRD:

```bash
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
```

Thay image de trigger rollout:

```bash
kubectl set image rollout/web web=nginx:1.27.1 -n w9
kubectl argo rollouts get rollout web -n w9 --watch
```

## Mentor keywords

- Canary: tang traffic tu tu cho version moi.
- AnalysisTemplate: cau hinh query metric de quyet dinh promote hay abort.
- Abort: dung rollout khi metric fail.
- Rollback: dua traffic ve stable version.
- Prometheus: noi Argo Rollouts doc success rate, latency, error rate.
- Traffic routing: lop nang cao dung Istio/NGINX/ALB de chia traffic chinh xac theo phan tram.

## Evidence nen chup

- `kubectl get rollout -n w9`.
- Rollout dung o buoc pause 20% hoac 50%.
- AnalysisRun `Successful` hoac `Failed`.
- Ghi ngan: Canary khac rolling update nhu the nao?
