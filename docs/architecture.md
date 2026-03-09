# System Architecture

The system follows a layered Salesforce automation architecture.

Layers:

Trigger Layer  
Handles record level events.

Service Layer  
Contains business logic for checklist creation and task orchestration.

Template Layer  
Defines checklist and task templates based on products.

UI Layer  
Lightning Web Components display checklist progress.

Automation Flow:

Opportunity → Conversion → Checklist Creation → Task Generation → Stage Synchronization