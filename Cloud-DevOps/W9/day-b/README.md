# T3 - D2 Observability, SLI/SLO va OTel

## Muc tieu

Phan biet:

- Monitoring: biet he thong co van de. Vi du CPU 90%.
- Observability: hieu vi sao co van de. Vi du traffic tang, DB cham, latency tang, request timeout.

Ba pillar can nho:

- Metrics: so lieu theo thoi gian, vi du CPU, RAM, latency, request/sec.
- Logs: nhat ky su kien, vi du `ERROR database timeout`.
- Traces: duong di cua mot request qua nhieu service.

## File da setup

- `otel/otel-collector-config.yaml`: cau hinh OTel Collector mau, nhan OTLP va expose metrics cho Prometheus scrape.
- `alert-rules/slo-burn-rate.yaml`: PrometheusRule mau cho availability burn rate.
- `dashboards/web-slo-dashboard.json`: dashboard Grafana toi gian de noi chuyen ve SLI/SLO.

## Flow can hieu

```text
Application
  -> OTel SDK/Agent
  -> OTel Collector
  -> Prometheus / Loki / Tracing backend
  -> Grafana
  -> Alert
```

Collector giong tram trung chuyen: app khong can biet se gui den Prometheus, Loki hay backend trace nao; app chi gui telemetry ve Collector.

## SLI - SLO - SLA

- SLI: chi so do duoc. Vi du success rate, p95 latency, availability.
- SLO: muc tieu noi bo. Vi du availability >= 99.9%.
- SLA: cam ket voi khach hang. Neu vi pham co the bi phat/den bu.

## Burn rate

Neu SLO availability la 99.9%, error budget la 0.1%. Burn rate cao nghia la error budget dang bi tieu qua nhanh.

Cong thuc y tuong:

```text
burn rate = actual error rate / allowed error rate
```

Vi du SLO 99.9% thi allowed error rate = 0.001. Neu hien tai error rate = 0.02, burn rate = 20x.

## Evidence nen chup

- Diagram/ghi chu flow App -> Collector -> Prometheus -> Grafana.
- Prometheus rule load duoc.
- Dashboard Grafana import duoc hoac giai thich duoc cac panel.
- Tra loi ngan: Metrics, Logs, Traces moi loai giup debug cau hoi nao?
