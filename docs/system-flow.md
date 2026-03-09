# System Flow

1. Product is selected in Opportunity.

2. Opportunity is converted into:

- Product Package
- Treasury Service

3. System identifies the selected product.

4. The corresponding Checklist Template is fetched.

5. A Checklist record is created and linked to:

- Opportunity
- Product Package
- Treasury Service

6. Task Templates generate operational tasks.

7. Tasks are assigned to operational users.

8. When tasks are updated:

- checklist stage progresses
- related objects stages synchronize

9. When all tasks are completed:

Checklist status becomes **Completed**.