# go-service

This profile targets Go service repositories.

It installs:

- the full backend-brownfield template set
- core workflow rule
- repository-local Cursor adapters
- repository-local Claude prompt adapters
- repository-local Krio prompt adapters
- workflow scripts

It does not install GitHub Copilot prompts by default, which keeps it a good middle ground between `minimal` and `backend-brownfield`.
