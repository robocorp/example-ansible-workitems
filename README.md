# Trigger a process from Ansible using Work Items

This robot demonstrates an use case of an Ansible playbook that will fail and call a
Robocorp process using [Control Room API](https://robocorp.com/docs/control-room/apis-and-webhooks) with a work item that containes the failure details. The type of message is selectable based on a property from the work item, so that the Ansible playbook can decide what type of message will be sent.

The playbook resides in the `playbook.yaml` file and can be executed with: `ansible-playbook playbook.yaml`

The simple robot that comes with the example only sends the details of a failure either to Slack or Email based on how the Playbook was configured.
