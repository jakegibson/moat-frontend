// Domain models for Admin feature.
//
// These clean Dart classes encapsulate the protobuf types, providing:
// - Simpler API for UI code
// - Decoupling from transport layer
// - Easier testing with mock data

/// Member in an organization.
class Member {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final bool hasAcceptedInvite;
  final bool deleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<MemberRole> roles;
  final List<String> locationIds;

  const Member({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.hasAcceptedInvite = false,
    this.deleted = false,
    this.createdAt,
    this.updatedAt,
    this.roles = const [],
    this.locationIds = const [],
  });

  String get fullName => '$firstName $lastName'.trim();
  bool get isPending => !hasAcceptedInvite && !deleted;
}

/// Role assigned to a member (simplified).
class MemberRole {
  final String id;
  final String name;
  final bool isSystem;
  final List<String> locationIds;

  const MemberRole({
    required this.id,
    required this.name,
    this.isSystem = false,
    this.locationIds = const [],
  });
}

/// Physical location.
class Location {
  final String id;
  final String name;
  final String description;
  final String address;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Location({
    required this.id,
    required this.name,
    this.description = '',
    this.address = '',
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.country = '',
    this.createdAt,
    this.updatedAt,
  });

  String get formattedAddress {
    final parts = [address, city, state, zipCode, country]
        .where((p) => p.isNotEmpty)
        .toList();
    return parts.join(', ');
  }
}

/// Role with full permission details.
class Role {
  final String id;
  final String name;
  final String description;
  final bool isSystem;
  final bool isAssignable;
  final List<Permission> permissions;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Role({
    required this.id,
    required this.name,
    this.description = '',
    this.isSystem = false,
    this.isAssignable = true,
    this.permissions = const [],
    this.createdAt,
    this.updatedAt,
  });
}

/// Permission that can be assigned to roles.
class Permission {
  final String id;
  final String name;
  final String description;
  final String category;

  const Permission({
    required this.id,
    required this.name,
    this.description = '',
    this.category = '',
  });
}

/// SSO domain configuration.
class SSODomain {
  final String id;
  final String domain;
  final String companyId;
  final String companyName;
  final List<String> allowedAuthProviders;
  final bool autoJoinEnabled;
  final String? defaultRoleId;
  final String? defaultRoleName;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SSODomain({
    required this.id,
    required this.domain,
    required this.companyId,
    this.companyName = '',
    this.allowedAuthProviders = const [],
    this.autoJoinEnabled = true,
    this.defaultRoleId,
    this.defaultRoleName,
    this.createdAt,
    this.updatedAt,
  });
}

/// Category for prompt templates.
enum PromptCategory {
  unspecified,
  extraction,
  analysis,
  generation,
  classification,
}

/// Prompt template for AI operations.
class PromptTemplate {
  final String id;
  final String key;
  final String name;
  final String description;
  final PromptCategory category;
  final int versionCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PromptTemplate({
    required this.id,
    required this.key,
    required this.name,
    this.description = '',
    this.category = PromptCategory.unspecified,
    this.versionCount = 0,
    this.createdAt,
    this.updatedAt,
  });
}

/// Token usage for AI generation.
class TokenUsage {
  final int prompt;
  final int completion;
  final int total;

  const TokenUsage({
    this.prompt = 0,
    this.completion = 0,
    this.total = 0,
  });
}

/// AI generation record.
class Generation {
  final String id;
  final String companyId;
  final String companyName;
  final String assetId;
  final String assetName;
  final String fileId;
  final String generationType;
  final bool success;
  final String? error;
  final String status;
  final int latencyMs;
  final TokenUsage? tokens;
  final double costUsd;
  final DateTime? createdAt;
  final DateTime? completedAt;

  const Generation({
    required this.id,
    this.companyId = '',
    this.companyName = '',
    this.assetId = '',
    this.assetName = '',
    this.fileId = '',
    this.generationType = '',
    this.success = false,
    this.error,
    this.status = '',
    this.latencyMs = 0,
    this.tokens,
    this.costUsd = 0.0,
    this.createdAt,
    this.completedAt,
  });

  bool get isError => !success && error != null && error!.isNotEmpty;
  bool get isComplete => status == 'completed' || status == 'failed';
}
