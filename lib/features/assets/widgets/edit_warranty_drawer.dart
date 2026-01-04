import 'package:flutter/material.dart';

import '../../../core/di/injection.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../data/warranty_coverage_client.dart';
import '../data/warranty_models.dart';

/// Drawer for editing a warranty coverage's details.
class EditWarrantyDrawer extends StatefulWidget {
  final WarrantyCoverage coverage;
  final String assetId;
  final VoidCallback onSaved;
  final VoidCallback onClose;
  final VoidCallback? onDeleted;

  const EditWarrantyDrawer({
    required this.coverage,
    required this.assetId,
    required this.onSaved,
    required this.onClose,
    this.onDeleted,
    super.key,
  });

  @override
  State<EditWarrantyDrawer> createState() => _EditWarrantyDrawerState();
}

class _EditWarrantyDrawerState extends State<EditWarrantyDrawer> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _expirationMonthsController = TextEditingController();
  final _pageNumberController = TextEditingController();
  final _warrantyClient = getIt<WarrantyCoverageClient>();

  // Provider contact fields
  final _providerNameController = TextEditingController();
  final _providerContactController = TextEditingController();
  final _providerPhoneController = TextEditingController();
  final _providerEmailController = TextEditingController();
  final _providerWebsiteController = TextEditingController();

  bool _isLoading = false;
  bool _updateFileAll = false;
  bool _providerFieldsModified = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.coverage.name ?? '';
    _descriptionController.text = widget.coverage.description ?? '';
    _expirationMonthsController.text =
        widget.coverage.expirationInMonths?.toString() ?? '';
    _pageNumberController.text = widget.coverage.pageNumber?.toString() ?? '';

    // Initialize provider fields
    _providerNameController.text = widget.coverage.effectiveProviderName ?? '';
    _providerContactController.text =
        widget.coverage.effectiveProviderContact ?? '';
    _providerPhoneController.text = widget.coverage.effectiveProviderPhone ?? '';
    _providerEmailController.text = widget.coverage.effectiveProviderEmail ?? '';
    _providerWebsiteController.text =
        widget.coverage.effectiveProviderWebsite ?? '';

    // Add listeners to track provider field changes
    _providerNameController.addListener(_checkProviderFieldsModified);
    _providerContactController.addListener(_checkProviderFieldsModified);
    _providerPhoneController.addListener(_checkProviderFieldsModified);
    _providerEmailController.addListener(_checkProviderFieldsModified);
    _providerWebsiteController.addListener(_checkProviderFieldsModified);
  }

  void _checkProviderFieldsModified() {
    final original = widget.coverage;
    setState(() {
      _providerFieldsModified =
          _providerNameController.text != (original.effectiveProviderName ?? '') ||
          _providerContactController.text !=
              (original.effectiveProviderContact ?? '') ||
          _providerPhoneController.text !=
              (original.effectiveProviderPhone ?? '') ||
          _providerEmailController.text !=
              (original.effectiveProviderEmail ?? '') ||
          _providerWebsiteController.text !=
              (original.effectiveProviderWebsite ?? '');
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _expirationMonthsController.dispose();
    _pageNumberController.dispose();
    _providerNameController.dispose();
    _providerContactController.dispose();
    _providerPhoneController.dispose();
    _providerEmailController.dispose();
    _providerWebsiteController.dispose();
    super.dispose();
  }

  Future<void> _deleteWarranty() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (BuildContext context) {
        final reasonController = TextEditingController();
        return AlertDialog(
          title: const Text('Delete Warranty'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to delete "${_nameController.text}"? This action cannot be undone.',
              ),
              const SizedBox(height: 16),
              TextField(
                controller: reasonController,
                decoration: const InputDecoration(
                  labelText: 'Reason for deletion (optional)',
                  hintText: 'Enter reason...',
                  border: OutlineInputBorder(),
                ),
                maxLength: 500,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(null),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop({
                'confirmed': true,
                'reason': reasonController.text.trim(),
              }),
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );

    if (result == null || result['confirmed'] != true) return;

    setState(() => _isLoading = true);

    try {
      await _warrantyClient.deleteWarrantyCoverage(
        widget.coverage.id,
        reason: result['reason'] as String?,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Warranty deleted successfully'),
            backgroundColor: AppColors.success,
          ),
        );
        widget.onDeleted?.call();
        widget.onClose();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting warranty: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _saveWarranty() async {
    if (!_formKey.currentState!.validate()) return;

    // Show confirmation dialog if bulk update is selected
    if (_updateFileAll && _providerFieldsModified) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Bulk Update Confirmation'),
            content: const Text(
              'This will update provider details for ALL warranties from the same file. Continue?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Continue'),
              ),
            ],
          );
        },
      );

      if (confirmed != true) return;
    }

    setState(() => _isLoading = true);

    try {
      final expirationMonths = int.tryParse(_expirationMonthsController.text);
      final pageNumber = int.tryParse(_pageNumberController.text);

      // Build details map for provider info
      final Map<String, dynamic> details = {};
      if (_providerNameController.text.isNotEmpty) {
        details['provider_name'] = _providerNameController.text;
      }
      if (_providerContactController.text.isNotEmpty) {
        details['provider_contact'] = _providerContactController.text;
      }
      if (_providerPhoneController.text.isNotEmpty) {
        details['provider_phone'] = _providerPhoneController.text;
      }
      if (_providerEmailController.text.isNotEmpty) {
        details['provider_email'] = _providerEmailController.text;
      }
      if (_providerWebsiteController.text.isNotEmpty) {
        details['provider_website'] = _providerWebsiteController.text;
      }

      await _warrantyClient.updateWarrantyCoverage(
        id: widget.coverage.id,
        name: _nameController.text,
        description: _descriptionController.text.isNotEmpty
            ? _descriptionController.text
            : null,
        expirationInMonths: expirationMonths,
        pageNumber: pageNumber,
        details: details.isNotEmpty ? details : null,
        updateFileAll: _updateFileAll && _providerFieldsModified,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _updateFileAll && _providerFieldsModified
                  ? 'Provider details updated for all related warranties'
                  : 'Warranty updated successfully',
            ),
            backgroundColor: AppColors.success,
          ),
        );
        widget.onSaved();
        widget.onClose();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating warranty: ${e.toString()}'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: AppColors.white,
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderPrimary),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: widget.onClose,
                  icon: const Icon(Icons.close, size: 20),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.bgSecondary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Edit Warranty',
                  style: AppTextStyles.textLGSemibold,
                ),
              ],
            ),
          ),

          // Form
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Warranty Name',
                          hintText: 'Enter warranty name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a warranty name';
                          }
                          if (value.length > 255) {
                            return 'Name must be less than 255 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Description field
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: 'Enter warranty description',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Duration field
                      TextFormField(
                        controller: _expirationMonthsController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Duration (months)',
                          hintText: 'Enter warranty duration in months',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final months = int.tryParse(value);
                            if (months == null || months < 0) {
                              return 'Please enter a valid number (0 or greater)';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Page number field
                      TextFormField(
                        controller: _pageNumberController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Page Number',
                          hintText: 'Enter page reference number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final pageNum = int.tryParse(value);
                            if (pageNum == null || pageNum < 1) {
                              return 'Please enter a valid page number';
                            }
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),
                      Text(
                        'Provider Contact Information',
                        style: AppTextStyles.textMDMedium,
                      ),
                      const SizedBox(height: 20),

                      // Provider name
                      TextFormField(
                        controller: _providerNameController,
                        decoration: InputDecoration(
                          labelText: 'Provider Name',
                          hintText: 'Enter provider or manufacturer name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Contact person
                      TextFormField(
                        controller: _providerContactController,
                        decoration: InputDecoration(
                          labelText: 'Contact Person/Department',
                          hintText: 'Enter contact person or department',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Phone
                      TextFormField(
                        controller: _providerPhoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter provider phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final phoneRegex = RegExp(r'^[\d\s\+\-\(\)]+$');
                            if (!phoneRegex.hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Email
                      TextFormField(
                        controller: _providerEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'Enter provider email address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final emailRegex =
                                RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Website
                      TextFormField(
                        controller: _providerWebsiteController,
                        keyboardType: TextInputType.url,
                        decoration: InputDecoration(
                          labelText: 'Website',
                          hintText: 'Enter provider website URL',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            final urlRegex = RegExp(r'^https?:\/\/.+');
                            if (!urlRegex.hasMatch(value)) {
                              return 'Please enter a valid URL (starting with http:// or https://)';
                            }
                          }
                          return null;
                        },
                      ),

                      // Bulk update checkbox
                      if (_providerFieldsModified) ...[
                        const SizedBox(height: 20),
                        CheckboxListTile(
                          title: const Text(
                              'Update all warranties from the same file'),
                          subtitle: Text(
                            'Apply provider contact changes to all warranties from this document',
                            style: AppTextStyles.textXS.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          value: _updateFileAll,
                          onChanged: (value) {
                            setState(() {
                              _updateFileAll = value ?? false;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Actions
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.borderPrimary),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _isLoading ? null : _deleteWarranty,
                    icon: Icon(Icons.delete_outline, color: AppColors.error),
                    label: Text(
                      'Delete',
                      style: TextStyle(color: AppColors.error),
                    ),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      side: BorderSide(color: AppColors.error),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _saveWarranty,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0, 48),
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.white,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.white,
                            ),
                          )
                        : const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
