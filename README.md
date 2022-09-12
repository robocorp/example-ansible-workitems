# Ansible example using Work Items

This robot demonstrates an use case of an Ansible playbook that will fail and will call a
robot with a work item that containes the failure details. The type of message is selectable
based on a property from the work item, so that the Ansible playbook can decide what type of
message will be sent.

The playbook resides in the `playbook.yaml` file and can be executed with: `ansible-playbook playbook.yaml`
