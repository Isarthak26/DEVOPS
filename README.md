# DEVOPS 3rd Semester Assignment

This repository contains solutions and implementations for the 3rd Semester DevOps assignment. The tasks include shell scripting, Jenkins setup, pipeline configuration, and system monitoring.

---

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Scripts](#scripts)
4. [Prerequisites](#prerequisites)
5. [Setup Instructions](#setup-instructions)
6. [Task Breakdown](#task-breakdown)
7. [Authors](#authors)

---

## Introduction

This repository addresses several DevOps challenges, such as automating Jenkins installation, configuring master-slave architecture, setting up role-based authorization, and more. It combines shell scripting and Jenkins pipeline workflows to streamline DevOps practices.

---

## Features
- **Jenkins Installation Script**:
  - OS-independent.
  - Supports version specification.
- **Jenkins Master-Slave Configuration**:
  - Executes up to 5 tasks concurrently.
- **Role-Based Authorization Setup**:
  - Implements RBAC policies for Jenkins.
- **Pipeline Creation**:
  - Executes shell scripts.
  - Monitors disk utilization.
  - Manages processes.
- **Backup Automation**:
  - Supports both direct copying and compressed backups.
  - Includes error handling, logging, and cleanup of older backups.
- **Java Build Pipeline**:
  - Supports polling and code-commit triggers.
  - Enforces execution time limits.
  - Publishes artifacts and supports parameterized builds.

---

## Scripts
### 1. **Jenkins Installation Script**
   - Installs Jenkins independently of OS-specific dependencies.
   - Allows version specification during installation.

### 2. **Backup Automation Script**
   - Takes source and destination directories as input.
   - Optional flag for compressed `.tar.gz` backup.
   - Logs success/failure with timestamps.
   - Cleans up backups older than 7 days.

### 3. **Pipeline Scripts**
   - Monitors disk utilization and sends alerts for >80%.
   - Automates process management tasks.

---

## Prerequisites
- **Tools and Technologies**:
  - Jenkins (Specific version support provided).
  - Shell scripting environment.
  - Java Development Kit (JDK) for building Java apps.
- **System Requirements**:
  - Linux/Unix-based OS.
  - Network connectivity for Jenkins setup.

---

## Setup Instructions
1. Clone this repository:
   ```bash
   git clone https://github.com/Isarthak26/DEVOPS.git
