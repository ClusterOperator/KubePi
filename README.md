<p align="center"><a href="https://clusteroperator.io"><img src="https://kubeoperator.oss-cn-beijing.aliyuncs.com/kubepi/img/logo-red.png" alt="kubepi" width="300" /></a></p>
<P align="center"><b>KubePi</b> [kubəˈpaɪ]，一个现代化的 K8s 面板。</P>
<p align="center">
  <a href="https://hub.docker.com/r/kubeoperator/kubepi-server"><img src="https://img.shields.io/docker/pulls/kubeoperator/kubepi-server" alt="Docker Pulls"></a>
  <a href="https://github.com/1Panel-dev/KubePi"><img src="https://img.shields.io/github/stars/1Panel-dev/KubePi?color=%231890FF&style=flat-square" alt="GitHub Stars"></a>
</p>
<hr />

## KubePi 是什么？

KubePi 是一个现代化的 K8s 面板。KubePi 允许管理员导入多个 Kubernetes 集群，并且通过权限控制，将不同 cluster、namespace 的权限分配给指定用户；允许开发人员管理 Kubernetes 集群中运行的应用程序并对其进行故障排查，供开发人员更好地处理 Kubernetes 集群中的复杂性。

## 快速开始

```
docker run --privileged -d --restart=unless-stopped -p 80:80 1panel/kubepi

# 用户名: admin
# 密码: kubepi
```

## UI 展示

![UI展示](https://kubeoperator.oss-cn-beijing.aliyuncs.com/kubepi/img/02-dashboard.png)

## License

Copyright (c) 2014-2024 [AECS 实验室](https://aecs.com/), All rights reserved.

Licensed under The GNU General Public License version 3 (GPLv3)  (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<https://www.gnu.org/licenses/gpl-3.0.html>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
