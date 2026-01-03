import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A section displaying the task location with an optional Route button.
/// Matches the Figma design for ticket detail view.
class LocationSection extends StatelessWidget {
  final String? locationName;
  final String? specificLocation;
  final String? address;
  final VoidCallback? onRouteTap;

  const LocationSection({
    super.key,
    this.locationName,
    this.specificLocation,
    this.address,
    this.onRouteTap,
  });

  bool get _hasLocation =>
      locationName != null ||
      specificLocation != null ||
      address != null;

  Future<void> _openMaps() async {
    // Build a search query from available location info
    final query = [
      locationName,
      specificLocation,
      address,
    ].where((s) => s != null && s.isNotEmpty).join(', ');

    if (query.isEmpty) return;

    // Try Google Maps first, fallback to Apple Maps on iOS
    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}',
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!_hasLocation) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.location_on,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (locationName != null)
                      Text(
                        locationName!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (specificLocation != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        specificLocation!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: onRouteTap ?? _openMaps,
                icon: const Icon(Icons.directions, size: 18),
                label: const Text('Route'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
