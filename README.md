# DevOps

# Resources Group

You can start with using an understandable naming convention. You named our resource group msftlearn-core-infrastructure-rg. You've given some indication of what it's used for (msftlearn), the types of resources contained within (core-infrastructure), and the type of resource it is itself (rg).

# Lock in Resources

Applying Read-only can lead to unexpected results because some operations that seem like read operations actually require additional actions. For example, placing a Read-only lock on a storage account prevents all users from listing the keys. The list keys operation is handled through a POST request because the returned keys are available for write operations.
