*** Settings ***
Documentation     Send messages to Slack if something bad happens
Library           RPA.Robocorp.WorkItems
Library           RPA.Notifier
Library           RPA.Email.ImapSmtp    smtp_server=smtp.gmail.com    smtp_port=587

*** Variables ***
${SLACK_WEBHOOK_URL}    https://hooks.slack.com/services/secrets/here
${CHANNEL}        Bogdan
${USERNAME}       bogdan@robocorp.com
${PASSWORD}       app-password-for-gmail
${RECIPIENT}      bogdan@robocorp.com

*** Keywords ***
Send message to Slack
    [Arguments]    ${logs}
    Notify Slack
    ...    Mayday: ${logs}
    ...    channel=${CHANNEL}
    ...    webhook_url=${SLACK_WEBHOOK_URL}

Send email
    [Arguments]    ${logs}
    Authorize    account=${USERNAME}    password=${PASSWORD}
    Send Message    sender=${USERNAME}
    ...    recipients=${RECIPIENT}
    ...    subject=Mayday
    ...    body=${logs}

Load and Process Ansible call
    ${payload}=    Get Work Item Payload
    ${destination}=    Set Variable    ${payload}[Destination]
    ${logs}=    Set Variable    ${payload}[Logs]
    IF    "${destination}" == "Slack"
        Send message to Slack    ${logs}
    ELSE IF    "${destination}" == "Email"
        Send email    ${logs}
    ELSE
        Log    ${payload}
    END


*** Tasks ***
Load and Process All Ansible calls
    For Each Input Work Item    Load and Process Ansible call