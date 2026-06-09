# W9 - Tong quan Deliver Smartly

W8 da di tu:

```text
Code
  -> Docker Image
  -> Deployment
  -> Pod
  -> Service
```

W9 them 3 lop moi:

```text
Code
  -> Git
  -> ArgoCD
  -> Kubernetes
  -> Prometheus/Grafana
  -> Canary Release
```

Muc tieu cuoi tuan: ung dung W8 duoc quan ly bang GitOps, co observability de do SLI/SLO va co canary rollout biet abort/rollback khi metric xau.

## Map T2 - T4

| Ngay | Thu muc | Trong tam | Output can co |
|---|---|---|---|
| T2 | `day-a/` | GitOps, GitHub Actions, ArgoCD, App of Apps, rollback | ArgoCD Application sync manifest W8 tu Git vao cluster |
| T3 | `day-b/` | Observability, OTel Collector, Prometheus, Grafana, SLI/SLO/SLA, burn rate | Config collector, dashboard/rule mau, reflection tra loi mentor |
| T4 | `day-c/` | Canary Deployment, Argo Rollouts, AnalysisTemplate | Rollout canary 20 -> 50 -> 100 va metric gate bang Prometheus |

## Cau hoi mentor hay hoi

- GitOps khac CI/CD nhu the nao?
- Vi sao `git revert` hop GitOps hon `kubectl rollout undo`?
- Monitoring khac Observability nhu the nao?
- Metrics, Logs, Traces dung de tra loi cau hoi gi?
- SLI, SLO, SLA khac nhau ra sao?
- Burn rate cao noi len dieu gi?
- Canary khac rolling update nhu the nao?
- Khi AnalysisTemplate fail thi Rollout lam gi?

## Thu tu lam nhanh

1. Doc `day-a/README.md`, sua `repoURL` trong `day-a/argocd/apps/web.yaml`, apply ArgoCD Application.
2. Doc `day-b/README.md`, xem OTel Collector, alert rule va dashboard mau.
3. Doc `day-c/README.md`, cai Argo Rollouts CRD neu chua co, apply services + rollout + analysis template.
4. Viet evidence/reflection moi ngay theo checklist trong tung thu muc.
