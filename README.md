# Proyecto GitOps con Argo CD

Este repositorio contiene la configuración y los recursos necesarios para implementar una infraestructura como código utilizando GitOps con Argo CD.

## Descripción

Este proyecto utiliza la metodología GitOps para gestionar la infraestructura de manera declarativa. La configuración de la infraestructura se almacena en este repositorio y se implementa automáticamente por Argo CD cada vez que hay cambios en la rama principal.

## Requisitos Previos

Asegúrate de tener instalado lo siguiente antes de comenzar:

- [Git](https://git-scm.com/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Argo CD](https://argoproj.github.io/argo-cd/)

## Estructura del Repositorio

- `argocd/`: Contiene la configuración de Argo CD.
- `applications/`: Directorio que almacena las definiciones de las aplicaciones gestionadas por Argo CD.
- `kustomize/`: Archivos Kustomize para la personalización de recursos Kubernetes.

## Configuración

### Argo CD

1. Instala Argo CD siguiendo las [instrucciones oficiales](https://argoproj.github.io/argo-cd/getting_started/).
1. Apunta Argo CD a este repositorio.

   ```bash
   argocd repo add <URL-repo>
   ```
1. Realizar un Port Forwarding para poder acceder a la API

    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8080:443
    ```
1.  Obtener password inicial    
    ```bash
    argocd admin initial-password -n argocd
    ```
1. Login    
    ```bash
    argocd login localhost
    ```
1. Levantar aplicaciones
    ```
    kubectl apply -f applications/
    ```
1. Sincroniza las aplicaciones en Argo CD.
    ```bash
    argocd app sync argocd
    ```

## Pasos siguientes 
Para poder urtilizar el sitio es necesario agregar los dominios al archivo `hosts` y crear los secretos para TLS.   
## Contribuir
Si deseas contribuir al desarrollo de este proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
1. Crea una rama para tu nueva funcionalidad: `git checkout -b feature/nueva-funcionalidad`.
1. Realiza tus cambios y haz commit: `git commit -m "Agrega nueva funcionalidad"`.
1. Haz push a tu rama: `git push origin feature/nueva-funcionalidad`.
1. Crea un Pull Request en GitHub.
## Problemas y Mejoras
Si encuentras algún problema o tienes sugerencias para mejorar el proyecto, abre un issue.

## Licencia
Este proyecto está bajo la licencia MIT.
## Autor
Ricardo Daniel Kiverling (rdkiverling@gmail.com)


