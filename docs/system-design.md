# System Design

This system automates treasury onboarding operations by dynamically generating checklists and operational tasks when an Opportunity is converted to a Product Package and Treasury Service.

The system ensures operational consistency and stage synchronization across all related records.

Architecture Layers

UI Layer  
Lightning Web Components provide visibility into checklist progress.

Automation Layer  
Flows and Apex triggers detect record conversions and initiate checklist generation.

Service Layer  
Apex services handle checklist creation, task assignment, and stage synchronization.

Data Layer  
Custom objects store checklist templates, task templates, and operational data.