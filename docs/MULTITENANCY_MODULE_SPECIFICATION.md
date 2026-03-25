# Multi-Tenancy Module Specification

## Document Purpose

This document defines the target behavior, access boundaries, and enforcement model for the ORISO multi-tenancy module. It is written to align product, engineering, QA, and operations on a single tenant-isolation standard.

## Scope

The specification covers:

- Super-admin capabilities across tenants
- Tenant-admin and tenant-scoped behavior
- Agency and consultant tenant binding
- Tenant settings and feature toggle governance
- Tenant-aware chat behavior
- Security, auditing, and acceptance criteria

## Core Principle

All tenant-scoped resources and operations must be constrained by `tenantId`, and no tenant-scoped role may access or mutate resources outside its own tenant boundary.

---

## Role Model

### SuperAdmin

SuperAdmin is the only role with global visibility and global control.

SuperAdmin can:

- Create new tenants and manage tenant lifecycle (activate, suspend, archive, delete policy).
- View consultants and agencies across all tenants with explicit tenant context.
- Create consultants/agencies for any tenant.
- Configure tenant-level settings.
- Grant feature-toggle permissions per tenant and per category.

SuperAdmin cannot:

- Bypass auditing requirements for cross-tenant actions.
- Perform privileged changes without traceability (actor, target tenant, timestamp, action).

### Tenant (Tenant-Scoped Admin/User)

Tenant-scoped roles operate only inside one tenant context.

Tenant-scoped roles can:

- Access and manage entities belonging to their own tenant.
- View only consultants/agencies within their tenant.
- Create/update tenant-scoped users and entities inside their tenant only.

Tenant-scoped roles cannot:

- Perform global tenant operations (tenant lifecycle/global listing/global configuration).
- Read or modify entities tied to another tenant.

---

## Agencies and Consultants

### Tenant Binding

Every agency and consultant record must contain a non-null `tenantId` at creation time (except explicitly defined legacy migration exceptions handled by policy).

### Visibility and Access

- Agencies/consultants are visible only within their tenant for tenant-scoped roles.
- SuperAdmin can view all, but UI and API responses must always show tenant context.
- Cross-tenant lookup by ID must return authorization-safe behavior (forbidden/not found according to security policy).

### Listing and Search Enforcement

All listing/search endpoints must enforce tenant filtering by default:

- Tenant-scoped role: implicit `tenantId = currentTenant`.
- SuperAdmin: optional tenant filter; cross-tenant view allowed.
- No endpoint may return mixed-tenant data to tenant-scoped roles.

---

## Tenant Settings and Feature Toggles

### Settings Model

Settings are stored per tenant and resolved at runtime using current tenant context.

Examples:

- Branding and UI settings
- Communication settings
- Chat feature switches
- Permission-related flags

### Feature Toggle Governance

- Toggles are tenant-specific and category-aware.
- Enable/disable is isolated per tenant.
- Effective permissions are both role-aware and tenant-aware.
- Defaults may exist globally, but tenant override takes precedence unless explicitly locked by SuperAdmin policy.

---

## Chat: Tenant-Aware Behavior

Chat flows must apply tenant context dynamically for consultant/agency/session scope.

### Behavioral Rules

- Chat capabilities are determined by tenant feature settings at runtime.
- Conversation behavior inherits tenant rules of involved consultant/agency context.
- Tenant-specific policy can enable/disable features (for example: attachments, special chat tools, advanced workflows).

### Isolation Guarantees

- No cross-tenant participant discovery for tenant-scoped roles.
- No cross-tenant chat metadata leakage through search, notifications, or previews.
- Any shared/global components must still enforce tenant scoping in data retrieval.

---

## Security and Compliance Requirements

### Authorization

- Every read/write action must validate role and tenant scope.
- Backend enforcement is mandatory; frontend filtering is supportive only.

### Data Isolation

- Tenant filter enforcement at repository/query/service layers.
- Defensive checks at controller/service boundary for tenant-scoped endpoints.

### Auditability

At minimum, log:

- Actor identity and role
- Target tenant
- Operation type (read/write/admin action)
- Resource identifiers
- Timestamp and outcome (success/failure)

---

## API and UI Expectations

### API

- Tenant-scoped endpoints must derive tenant from authenticated context.
- SuperAdmin endpoints may include tenant selector/filter parameters.
- Error semantics for unauthorized cross-tenant access must be consistent platform-wide.

### UI

- SuperAdmin UI must display tenant context clearly in global lists.
- Tenant-scoped UI must never expose global tenant controls.
- Feature availability in UI should reflect effective tenant toggle state.

---

## Acceptance Criteria

The multi-tenancy module is considered complete when all conditions hold:

1. SuperAdmin can create/manage tenants and create tenant-bound consultants/agencies for any tenant.
2. Tenant-scoped users can only access and mutate resources in their own tenant.
3. Agencies/consultants are always tenant-bound and returned only within allowed tenant scope.
4. Listing/search APIs enforce tenant filtering reliably.
5. Tenant settings and feature toggles are resolved and applied per tenant.
6. Chat capabilities change according to tenant configuration and stay tenant-isolated.
7. Cross-tenant access attempts are blocked and auditable.

---

## Non-Functional Expectations

- **Consistency:** tenant behavior is uniform across services.
- **Performance:** tenant filtering does not materially degrade critical list/search endpoints.
- **Observability:** tenant context included in operational logs/metrics where appropriate.
- **Extensibility:** new modules can adopt tenant-scoped policy without redesign.

---

## Summary

This multi-tenancy model establishes strict tenant isolation for tenant-scoped roles, controlled global governance for SuperAdmin, and tenant-aware runtime behavior for settings, permissions, and chat capabilities. The implementation must prioritize backend-enforced boundaries, auditable administration, and predictable tenant-specific behavior across all user journeys.

