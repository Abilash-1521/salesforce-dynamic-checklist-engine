# Salesforce dynamic-checklist-engine


## Overview

This project implements an automated operational checklist management system built using **Salesforce Apex, Triggers, Flows, and Lightning Web Components (LWC)**.

When an **Opportunity is converted into a Product Package and Treasury Service**, the system automatically generates a **product-specific operational checklist**.

The checklist is created based on predefined **Checklist Templates**, which generate operational **Tasks** using **Task Templates**.

The system ensures that task completion and stage progression remain synchronized across multiple related objects including:

* Opportunity
* Product Package
* Treasury Service
* Checklist

This automation ensures operational consistency, visibility, and proper task tracking during treasury service onboarding.

---

## Business Problem

Treasury onboarding processes often require multiple operational tasks to be completed across several teams and objects. Managing these tasks manually can result in:

* missed operational steps
* inconsistent stage updates
* lack of progress visibility
* operational delays

This system automates checklist generation, task assignment, and stage synchronization to streamline treasury onboarding workflows.

---

## Key Features

* Product-based checklist automation
* Checklist creation during Opportunity conversion
* Template driven task generation
* Automated task assignment
* Stage synchronization across multiple objects
* Task lifecycle management
* Rework and On-Hold handling
* Lightning Web Component dashboard for checklist visibility

---

## Objects Involved

### Standard Objects

* Opportunity
* Product
* Task

### Custom Objects

* **Product_Package__c**
* **Treasury_Service__c**
* **Checklist__c**
* **Checklist_Template__c**
* **Task_Template__c**

---

## Automation Flow

1. A Product is selected on an Opportunity.

2. The Opportunity is converted into:

   * **Product Package**
   * **Treasury Service**

3. During this conversion process, the system identifies the selected Product.

4. Based on the Product, the system fetches the corresponding **Checklist Template**.

5. A **Checklist record** is created and linked to:

   * Opportunity
   * Product Package
   * Treasury Service

6. The Checklist Template generates a set of **Tasks** using Task Templates.

7. Tasks are assigned to the appropriate operational users.

8. When a user updates a task status (Complete, Rework, On-Hold, etc.), the system evaluates checklist progress.

9. The checklist stage is updated once all tasks within a stage are completed.

10. Stage progression is synchronized across:

* Opportunity
* Product Package
* Treasury Service

11. Once all tasks in the checklist are completed, the checklist is marked **Completed**, ensuring all related objects are also completed.

---

## Task Lifecycle

The system supports multiple task actions and statuses to handle real operational scenarios.

### Task Actions

* Complete
* Rework
* On-Hold
* On-Hold Rework

### Task Status

* New
* Assigned
* In Progress
* Rework
* On-Hold
* On-Hold Rework

When a task is completed:

* The next task in the sequence is automatically assigned.
* The checklist stage progresses.
* Related objects update their stage accordingly.

---

## Stage Synchronization

The system ensures stage consistency across all related objects.

Whenever a task status is updated, automation validates checklist progress and updates the corresponding stages for:

* Opportunity
* Product Package
* Treasury Service
* Checklist

This guarantees that operational progress remains aligned across all related records.

---

## Technology Stack

* **Apex**
* **Apex Triggers**
* **Salesforce Flows**
* **Lightning Web Components (LWC)**
* **SOQL**
* **Custom Objects**
* **Task Automation**

---

## Architecture

```
Opportunity
     ↓
Opportunity Conversion
     ↓
Product Package Created
Treasury Service Created
     ↓
Checklist Template Identified
     ↓
Checklist Created
     ↓
Task Templates Generate Tasks
     ↓
Tasks Assigned
     ↓
Task Completion
     ↓
Checklist Stage Update
     ↓
Stage Sync Across Objects
     ↓
Checklist Completed
```

---

## Repository Structure

```
salesforce-treasury-checklist-automation
│
├── docs
│   ├── architecture.md
│   ├── system-flow.md
│   └── data-model.md
│
├── force-app
│   └── main
│       └── default
│           ├── classes
│           ├── triggers
│           ├── lwc
│           ├── objects
│           └── permissionsets
│
└── scripts
```

---

## Example Workflow

```
Opportunity Created
      ↓
Product Selected
      ↓
Opportunity Converted
      ↓
Product Package Created
Treasury Service Created
      ↓
Checklist Generated
      ↓
Tasks Created From Templates
      ↓
Tasks Assigned
      ↓
Tasks Completed
      ↓
Checklist Stage Updated
      ↓
Checklist Completed
```

---

## Future Improvements

* Operational dashboard for checklist tracking
* SLA monitoring for tasks
* Notification automation for pending tasks
* Integration with external treasury systems

---

## Author

Abi
Salesforce Developer

LinkedIn
linkedin.com/in/abilash-s-a48725368
