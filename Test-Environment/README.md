# Test-Environment
Test Environments are a way to create test environments on either Azure or AWS to test the PwshDocker module.

## Why?
Because in many cases, engineers don't want to take a module written by a guy (I'm the guy) on GitHub and just install it anywhere. Instead, they want to install it in a test environment. Because of that, Test-Environments make it easy for you to do just that by creating a test environment for you.

## What Language Is Used?
To create the test environments, the Test-Environment directory contains Ansible Galaxy roles for both Azure and AWS. Ansible is a configuration management tool that allows you to create infrastructure and configure it in a specific way. 

## What Do The Ansible Galaxy Roles Give Me?
A way to create the following components

In Azure:
    - Resource Group
    - Virtual Network
    - Public IP Address For The Virtual Machine
    - Network Security Group that Allows SSH to Port 22
    - Virtual Machine NIC
    - The Virtual Machine
    - Install PowerShell Core
    - Installation of Docker To Test The PwshDocker Module
    - The PwshModule Copied to `/home`