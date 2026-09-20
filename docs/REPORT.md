# CrownMart Final Report

## Known Limitations

1. **Rate limiting is per HTTP session.** If a user deletes cookies, they get a new session and a new limit. We can make it stronger with an IP-based limit.
2. **Cache and rate-limit data are in memory only.** They are lost when the server restarts. They are not shared between many servers.
3. **The mock chatbot uses keywords only.** It is not a real conversation. Its answers are written by hand, so we must update them if the site pages change.
4. **The Gemini provider is not tested with the live API.** Unit tests check only the response parsing. Model names may change over time.
5. **Render free tier has cold starts.** The first request after idle can take about a minute. The H2 database also goes back to seed data on every restart.