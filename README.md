<div id="top"></div>

<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![GPLv3 License][license-shield]][license-url]
[![Last Commit][last-commit-shield]][last-commit-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">

<h2 align="center">Kubernetes on Oracle Cloud Infrastructure</h2>

  <p align="center">
    <i>Deploy a Kubernetes cluster on OCI Free Tier using Terraform & Ansible</i>
    <br />
  </p>
</div>
<br />

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#prerequisites">Installation</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#troubleshooting">Troubleshooting</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>
<br />


<!-- GETTING STARTED -->
## Getting Started


The following must already be present on your system
* [Terraform CLI](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html)
* [Kubectl](https://kubernetes.io/docs/tasks/tools/)
* [OCI config file](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkconfig.htm)
<br />

### IMPORTANT NOTICE

Oracle has started restricting free tier accounts from launching new instances in most Regions. If you get a Resouce Capacity error the only solution so far is to upgrade your account to Pay As You Go. You should then be able to launch the resources. As long as you use the Always Free resources you still wont be charged even though your account is now upgraded.


## Usage

1. Clone this repository
   ```sh
   git clone https://github.com/solamarpreet/kubernetes-on-oci.git
   ```
   ```sh
   cd kubernetes-on-oci/terraform
   ```

2. Change the values in `terraform.tfvars` as per your needs
   ```sh
   nano terraform.tfvars
   ```

3. Rename `secret.tfvars.example` to `secret.tfvars` and populate it with values
   ```sh
   mv secret.tfvars.example secret.tfvars
   ```
   ```sh
   nano secret.tfvars
   ```

4. Initialize terraform
   ```sh
   terraform init
   ```

5. Apply terraform configuration
   ```sh
   terraform apply --var-file=secret.tfvars
   ```

6. Install either Microk8s or K3s on the created infrastructure depending on your preference
   ```sh
   cd ../ansible
   ```
   ```sh
   # Recommended
   ansible-playbook playbooks/microk8s.yml
   ```
   or
   ```sh
   ansible-playbook playbooks/k3s.yml
   ```

7. Copy the kubeconfig file to ~/.kube/config
   ```sh
   mkdir -p ~/.kube && cp kubeconfig ~/.kube/config
   ```

8. Start using kubectl commands
   ```sh
   kubectl get nodes
   ```

<br />
<p align="right">(<a href="#top">back to top</a>)</p>


<!-- TROUBLESHOOTING -->
## Troubleshooting

Check the [open issues](https://github.com/solamarpreet/kubernetes-on-oci/issues) for a list known issues and open a new issue if necessary.

<br />

<!-- ROADMAP -->
## Roadmap

- [ ] Add Ansible playbook for provisioning a private container registry on the VM.Standard.E2.1.Micro instance


<br />

<!-- CONTRIBUTING -->
## Contributing

Please create pull requests in the `dev` branch. You can also give your ideas by opening a new issue and describing the features you would like to see added.

<br />

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<br />

<!-- CONTACT -->
## Contact

Amarpreet Singh - solamarpreet@protonmail.com

Blog & Portfolio : [https://solamarpreet.github.io](https://solamarpreet.github.io)

<br />

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Dennis Pfisterer](https://github.com/pfisterer/edsc-microk8s-playbook)
* [Python Discord](https://www.pythondiscord.com)

<br />
<p align="right">(<a href="#top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/solamarpreet/kubernetes-on-oci.svg?style=for-the-badge
[contributors-url]: https://github.com/solamarpreet/kubernetes-on-oci/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/solamarpreet/kubernetes-on-oci.svg?style=for-the-badge
[forks-url]: https://github.com/solamarpreet/kubernetes-on-oci/network/members
[stars-shield]: https://img.shields.io/github/stars/solamarpreet/kubernetes-on-oci.svg?style=for-the-badge
[stars-url]: https://github.com/solamarpreet/kubernetes-on-oci/stargazers
[issues-shield]: https://img.shields.io/github/issues/solamarpreet/kubernetes-on-oci.svg?style=for-the-badge
[issues-url]: https://github.com/solamarpreet/kubernetes-on-oci/issues
[license-shield]: https://img.shields.io/github/license/solamarpreet/kubernetes-on-oci.svg?style=for-the-badge
[license-url]: https://github.com/solamarpreet/kubernetes-on-oci/blob/main/LICENSE
[last-commit-shield]: https://img.shields.io/github/last-commit/solamarpreet/kubernetes-on-oci?style=for-the-badge
[last-commit-url]: https://github.com/solamarpreet/kubernetes-on-oci/pulse

