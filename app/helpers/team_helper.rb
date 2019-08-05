module TeamHelper
  def team_creation_button(challenge)
    create_team_failure_reason = {}
    if policy(challenge).create_team?(create_team_failure_reason)
      disabled = false
      title = 'Create a team for this challenge'
    else
      disabled = true
      title = case create_team_failure_reason[:sym]
              when :participant_not_logged_in
                'You must be logged in to create a team'
              when :challenge_not_running
                'This challenge is not running'
              when :challenge_teams_frozen
                'This challenge has team-freeze in effect'
              when :team_exists
                'You are already on a team for this challenge'
              else
                'You may not create a team for this challenge at this time'
              end
    end

    content_tag(
      :span,
      title: title,
      class: 'pull-right mr-1',
      data: {
        toggle: 'tooltip',
      },
    ) do
      button_tag(
        'Create Team',
        type: 'button',
        disabled: disabled,
        class: 'btn btn-secondary btn-sm',
        data: {
          toggle: 'modal',
          target: '#create-team-modal',
        },
      )
    end
  end

  def team_invitation_cancel_button(invitation)
    if policy(invitation.team).cancel_invitations?
      title = 'Cancel this invitation'
      disabled = false
    else
      title = 'Only team organizers may cancel invitations to the team'
      disabled = true
    end

    if disabled
      button_tag(
        'Cancel',
        title: title,
        type: 'button',
        disabled: true,
        class: 'btn btn-sm btn-secondary',
        data: {
          toggle: 'tooltip',
        },
      )
    else
      link_to(
        'Cancel',
        team_invitation_cancellations_path(invitation),
        title: title,
        class: 'btn btn-sm btn-secondary',
        data: {
          method: :post,
          toggle: 'tooltip',
          confirm: 'Are you sure?',
          disable: 'Cancel',
        },
      )
    end
  end

  def team_member_invite_button(team)
    if policy(team).create_invitations?
      disabled = false
      title = 'Invite a new member to this team'
    else
      if current_participant.nil?
        title = 'You must be logged in to invite members to your team'
      elsif !team.organized_by?(current_participant)
        title = 'Only team organizers may invite members to the team'
      elsif team.challenge.teams_frozen?
        title = "The team's challenge has team-freeze in effect"
      else
        title = 'You may not invite new members at this time'
      end
      disabled = true
    end

    content_tag(
      :span,
      title: title,
      data: {
        toggle: 'tooltip',
      },
    ) do
      button_tag(
        'Invite member',
        type: 'button',
        disabled: disabled,
        class: 'btn btn-secondary',
        data: {
          toggle: 'modal',
          target: '#invite-team-member-modal',
        },
      )
    end
  end
end
