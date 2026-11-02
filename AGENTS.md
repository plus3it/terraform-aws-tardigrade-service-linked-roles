# Agent Instructions

Before starting any task in this repository:

1. Run `make agents/sync`. It writes the shared Plus3 IT instructions for this repository's tardigrade-ci version to `.agents/plus3it/AGENTS.md`.
2. Read `.agents/plus3it/AGENTS.md` and follow it together with this file. If the sync fails, tell the user, and don't guess the conventions.

These rules always apply, even without the shared instructions:

- Don't push, open pull requests, publish releases, or apply infrastructure changes unless the user asks. List those steps for a person in your final report.
- Don't edit files under `.agents/plus3it/`; they are generated and overwritten by the sync.

@.agents/plus3it/AGENTS.md

## Repository-specific

### Purpose

This Terraform module creates AWS IAM service-linked roles. It creates one `aws_iam_service_linked_role` for each service principal in `aws_service_names` (which defaults to a long built-in list) that is not also in `excluded_aws_service_names` (which defaults to services that AWS Organizations normally creates or that cannot be reliably deleted). The `iam_service_linked_roles` output returns the created roles as a map keyed by service principal.
