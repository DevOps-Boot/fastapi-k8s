 # Monitoring

## Présentation

Dans une infrastructure DevOps , il est important de supeviser en continue le fonctionne des différents environnements.

## Sélection des outils

Nous avons choisi Prometheus et Grafana pour notre monitoring et l’alerting.
La configuration automatique de notre monitoring est gérée par Prometheus-Operator.
Son rôle est de renvoyer les données à Grafana pour la visualisation.

## Sélection des outils

Nous avons choisi Prometheus et Grafana pour notre monitoring et l’alerting.
La configuration automatique de notre monitoring est gérée par Prometheus-Operator.
Son rôle est de renvoyer les données à Grafana pour la visualisation.

## Installation et configuration

Notre application Prometheus et Grafana est déployée en utilisant des packages dans des Charts Helm.

La configuration du Chart Helm est défini dans le fichier ci-dessous : 
fastapi-k8s/terraform/deployments/releases/kube-prometheus-stack.tf

Pour ne pas mettre de mot de passe dans notre code, nous utilisons une variable d'environnement pour renseigner le mot de passe attendu en valeur 

```console
  set {
    name  = "grafana.adminPassword"
    value = var.grafana_admin_password
  }
  values = [
    file("${path.module}/kube-prometheus-stack/kube-prometheus-stack-values.yaml")
  ]
```

La variable d'environnement qu'il faudra enseigner sera dans ce format :
`TF_VAR_grafana_admin_password = [adminPassword]`


Dans le fichier suivant, contient toute la configuration par défaut de notre Prometheus-Operator
/vagrant/fastapi-k8s/terraform/deployments/releases/kube-prometheus-stack/kube-prometheus-stack-values.yaml
Il précise les fonctionnalités à activer telles que alermanger, grafana, Prometheus-Operator et Prometheus.

La persistance des données est comme toujours un élément important à prendre en compte, dès lors, nous avons modifier ces éléments pour conserver les données collectés et la configuration.  

Un stockage aws ebs pour Grafana

```console
    storageClassName: ebs-sc
    accessModes:
      - ReadWriteOnce
    size: 5Gi
```

Un stockage aws ebs pour prometheus

```console
  storageSpec:
    volumeClaimTemplate:
      spec:
        storageClassName: ebs-sc
        accessModes:
          - ReadWriteOnce
        resources:
          requests:
            storage: 5Gi
```

Cette partie installe un pod-monitor qui va présenter les données à Prometheus en présentant le endpoint.


```console
  additionalPodMonitors:
    - name: "postgresql"
      selector:
        matchLabels:
          application: spilo          # C'est notre Postgres-Cluster
      podTargetLabels:                # Les labels des pods concernés qui tournent dans le cluster. 
        - spilo-role                  
        - cluster-name
        - team
      namespaceSelector:
        any: true                      # Il est autorisé à chercher dans toutes les namespaces
      podMetricsEndpoints:
        - port: exporter               # definition du fonctionnement du endpoint nommé exporter
          interval: 15s
          scrapeTimeout: 10s
        - targetPort: 8008             # Il expose le endpoint et défini son fonctionnement. 
          interval: 15s
          scrapeTimeout: 10s
```

## Dashboards granafa installés

L'installation des ces 2 dashboards est réalisée à partir des IDs fournit par la bibliothèque de Dashbord d du site de l'éditeur Grafana.

https://grafana.com/grafana/dashboards/9628-postgresql-database/

https://grafana.com/grafana/dashboards/16310-docker-and-system-monitoring/ 

## Sources de documentation

Référence de documentation operator-prometheus
(https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack)


Les articles utiles pour la mise en place de notre monitoring
(https://medium.com/israeli-tech-radar/how-to-create-a-monitoring-stack-using-kube-prometheus-stack-part-1-eff8bf7ba9a9)

(https://devapo.io/blog/technology/how-to-set-up-prometheus-on-kubernetes-with-helm-charts/)
