# T2 - D1 GitOps va CI/CD

## Muc tieu

Hieu flow GitOps:

```text
Git push
  -> ArgoCD theo doi repo
  -> So sanh desired state trong Git voi live state trong cluster
  -> Sync vao Kubernetes
```

Trong GitOps, Git la source of truth. Developer khong deploy bang tay nua; developer thay doi manifest trong Git, review qua PR, merge/push, ArgoCD tu dong dong bo vao cluster.

## File da setup

- `k8s/web.yaml`: manifest web lay tu bai W8, gom Namespace, Deployment, Service.
- `argocd/apps/web.yaml`: ArgoCD Application quan ly app web.
- `argocd/app-of-apps.yaml`: Application cha de quan ly nhieu app con.
- `.github/workflows/gitops-ci.yml`: workflow mau cho validate manifest tren PR/push. GitHub chi tu dong chay workflow nam o repo root `.github/workflows/`; file nay de hoc va co the copy len root khi can.

## Can sua truoc khi apply

Trong `argocd/apps/web.yaml` va `argocd/app-of-apps.yaml`, thay:

```yaml
repoURL: https://github.com/<your-org>/<your-repo>.git
```

bang repo GitHub that cua ban.

Neu branch khong phai `main`, sua:

```yaml
targetRevision: main
```

## Lenh thuc hanh goi y

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f Cloud-DevOps/W9/day-a/argocd/apps/web.yaml
kubectl get applications -n argocd
kubectl get deploy,svc -n w9
```

Kiem tra drift:

```bash
kubectl scale deployment web -n w9 --replicas=1
kubectl get application web -n argocd
```

Neu ArgoCD auto-sync/self-heal bat, cluster se quay lai `replicas: 3`.

## Rollback can nho

GitOps chuan:

```bash
git revert <commit>
git push
```

Kubernetes truc tiep:

```bash
kubectl rollout undo deployment/web -n w9
```

Mentor co the hoi: cach Kubernetes rollback nhanh hon, nhung khong hop GitOps bang `git revert` vi live state bi sua ngoai Git.

## Evidence nen chup

- ArgoCD Application `Synced` va `Healthy`.
- `kubectl get deploy,svc -n w9`.
- Drift test: scale tay ve 1 replica, ArgoCD dua lai 3 replicas.
- Ghi ngan cau tra loi: GitOps khac CI/CD nhu the nao?
