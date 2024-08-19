

## Format Options


1. CLI
   1. Details included:
         1. Only includes failures
         2. Includes link to documentation for Rule
         3. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
2. CSV
   1. Details included:
            1. Only includes failures
            2. Includes link to documentation for Rule
            3. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
3. cyclonedx (XML)
   1. Details included:
      1. Less Details than other formats
      2. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
4. cyclonedx_json (JSON)
   1. Details included:
      1. Less Details than other formats
      2. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
5. JSON
   1. Details included:
      1. Includes both Sucessfull and Failed Checks
      2. List of Rules and 
      3. Full file paths
      4. Code Blocks
      5. Help URL 
      6. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
6. SARIF
   1. Details included:
      1. Only Failed Checks (Listed as Non-Security 'Errors')
         1. Type is fixed for all items as "error" instead of (Critical, High, Medium, Low, Error, Warningm Note
      2. Help URL but these are not used by GitHub Code Scanning UI
      3. **ALL FAILURES ARE LISTED AS ERRORS, DOES NOT INCLUDE SEVERITY**

7. github_failed_only (MARKDOWN)
   1. Details included:
      1. Only includes failures
      2. Includes link to documentation for Rule
      3. Less Details than other formats
      4. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
8. junitxml (XML)
      1. Details included:
         1. Only includes failures
         2. Includes link to documentation for Rule
         3. Includes code blocks with error
         4. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
9. gitlab_sast (JON)
   1. Details included:
      1. Only includes failures
      2. Includes link to documentation for Rule
      3. Doesn't include code blocks with error
      4. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**
10. spdx (Text)
   1. Details included:
      1. Only includes failures
      2. Doens't include link to documentation for Rule
      3. Doesn't include code blocks with error
      4. Very Few Details included
      5. **DOES NOT INCLUDE FAILURE TYPE OR SEVERITY**