# PHP Security Code Review Prompt for Claude Code

## GitHub Actions Workflow Configuration

```yaml
name: PHP Security Code Review
on:
  pull_request:
    paths:
      - '**.php'

jobs:
  security-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run PHP Security Review
        run: |
          claude-code --prompt-file .github/security-review-prompt.md --include="*.php" --output-format=github-issue
```

## Security Review Prompt

You are conducting a comprehensive security code review for a PHP application. Analyze all PHP files for security vulnerabilities, focusing on both technical vulnerabilities and design-level security flaws.

### Review Scope
- **Language**: PHP (plain PHP application)
- **Files**: All `.php` files in the repository
- **Focus**: Entire application codebase

### Vulnerability Categories to Check

#### 1. OWASP Top 10 Web Application Vulnerabilities
- **Injection Flaws**: SQL injection, NoSQL injection, command injection, LDAP injection
- **Broken Authentication**: Session management, password policies, multi-factor authentication
- **Sensitive Data Exposure**: Unencrypted data storage/transmission, hardcoded credentials
- **XML External Entities (XXE)**: XML parsing vulnerabilities
- **Broken Access Control**: Authorization bypass, privilege escalation
- **Security Misconfiguration**: Default configurations, error handling, HTTP headers
- **Cross-Site Scripting (XSS)**: Reflected, stored, DOM-based XSS
- **Insecure Deserialization**: Object injection, deserialization of untrusted data
- **Using Components with Known Vulnerabilities**: Outdated libraries and dependencies
- **Insufficient Logging & Monitoring**: Security event logging, monitoring gaps

#### 2. PHP-Specific Vulnerabilities
- **File Inclusion**: Local/Remote file inclusion (LFI/RFI)
- **Code Injection**: eval(), dynamic function calls, variable variables misuse
- **Path Traversal**: Directory traversal attacks
- **Type Juggling**: Loose comparison vulnerabilities
- **Unserialize**: Insecure object deserialization
- **File Upload**: Unrestricted file upload vulnerabilities
- **Session Security**: Session fixation, hijacking, insecure session handling
- **HTTP Header Injection**: Response splitting, header manipulation

#### 3. Business Logic and Design Vulnerabilities
- **Insecure Direct Object References (IDOR)**: Missing authorization checks on object access
- **Privilege Escalation**: Vertical and horizontal privilege escalation
- **Business Logic Bypass**: Workflow manipulation, race conditions
- **Price Manipulation**: In e-commerce or financial applications
- **Account Enumeration**: Username/email enumeration attacks
- **Rate Limiting**: Missing or insufficient rate limiting
- **Data Validation**: Client-side validation bypass
- **Workflow Violations**: Process sequence manipulation

### Analysis Instructions

For each vulnerability found:

1. **Identify the exact location** (file path and line number)
2. **Classify the vulnerability type** from the categories above
3. **Assign severity level**:
   - 🔴 **CRITICAL**: Remote code execution, SQL injection with admin access, authentication bypass
   - 🟠 **HIGH**: Data exposure, privilege escalation, significant business logic flaws
   - 🟡 **MEDIUM**: XSS, CSRF, information disclosure, moderate business logic issues
   - 🟢 **LOW**: Minor information leaks, missing security headers, hardening opportunities

4. **Provide clear remediation steps** with code examples where applicable

### Output Format

Format your findings as GitHub issues using this template:

```markdown
## 🔴 [CRITICAL/HIGH/MEDIUM/LOW] [Vulnerability Type] in [File Path]

**Location**: `[file_path]:[line_number]`

**Description**: 
Brief explanation of the vulnerability and its potential impact.

**Vulnerable Code**:
```php
// Show the problematic code snippet
```

**Risk**: 
Explain what an attacker could achieve by exploiting this vulnerability.

**Remediation**:
```php
// Provide secure code example
```

**Additional Notes**: 
Any additional context or considerations.

---
```

### Special Focus Areas

Pay particular attention to:
- User input handling and validation
- Database query construction
- File operations and uploads
- Session and authentication mechanisms
- Authorization and access control logic
- Error handling and information disclosure
- Configuration and environment variables
- Third-party integrations and API calls

### Review Guidelines

- **Be thorough but practical**: Focus on exploitable vulnerabilities over theoretical issues
- **Consider context**: Understand the application's purpose and data sensitivity
- **Prioritize impact**: Emphasize vulnerabilities that could lead to data breach or system compromise
- **Provide actionable advice**: Include specific, implementable remediation steps
- **Check for defense in depth**: Look for missing security layers
- **Validate input/output**: Ensure all user inputs are properly validated and outputs are properly encoded

Begin your security analysis now, examining each PHP file systematically for the vulnerabilities outlined above.
