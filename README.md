# Salesforce dynamic-checklist-engine
The Dynamic Checklist Engine is a configurable automation framework built on Salesforce using Apex, Triggers, Flows and Lightning Web Components (LWC).

The engine dynamically generates operational checklists and tasks based on product-driven templates when an Opportunity is converted into downstream service objects such as Product Package and Treasury Service.

The system ensures that operational tasks, checklist stages and related business objects remain synchronized throughout the lifecycle.
## Dynamic Checklist Engine Concept

The engine uses a **template driven architecture**.

Instead of hardcoding business processes, the system allows administrators to configure:

* Checklist Templates
* Task Templates
* Product mappings
* Stage progression logic

This allows the same engine to support multiple business processes such as:

* Treasury onboarding
* Client onboarding
* Product activation
* Compliance workflows
* Operations processing

The current implementation demonstrates the engine using a **Treasury Service onboarding workflow**.


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
## Scalability

The Dynamic Checklist Engine is designed for scalability.

New workflows can be supported by simply creating new:

- Checklist Templates
- Task Templates
- Product mappings

No Apex code changes are required.

This allows organizations to rapidly configure operational processes without development effort.

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
## Project Demo

Example Scenario

1. Sales user creates an **Opportunity**.
2. A **Product** is selected for the Opportunity.
3. The Opportunity is converted into:

- Product Package
- Treasury Service

4. The system identifies the Product.

5. A **Checklist Template** mapped to that Product is retrieved.

6. A **Checklist record** is created and linked to:

- Opportunity
- Product Package
- Treasury Service

7. **Task Templates generate operational tasks**.

8. Tasks are assigned to operations teams.

9. When users update task status:

- Checklist stage progresses
- Opportunity stage updates
- Product Package stage updates
- Treasury Service stage updates

10. Once all tasks are completed:

Checklist status becomes **Completed**.
## Apex Architecture Pattern

This project follows an enterprise Apex architecture pattern.

Trigger Layer

Triggers only handle record events and delegate logic to handler classes.

Handler Layer

Trigger handlers control execution flow and enforce separation of concerns.

Service Layer

Service classes contain business logic for:

- checklist generation
- task assignment
- stage synchronization

This architecture ensures:

- scalability
- maintainability
- reusable logic

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
## Skills Demonstrated

Salesforce Apex Development  
Trigger Framework Implementation  
Lightning Web Components (LWC)  
SOQL Query Optimization  
Business Process Automation  
Enterprise Architecture Design  
Multi-object Data Synchronization

## Author

Abi
Salesforce Developer

LinkedIn
linkedin.com/in/abilash-s-a48725368
