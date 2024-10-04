import 'package:flutter/material.dart';
import 'constants.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({super.key});

  @override
  _PersonalInformationPageState createState() => _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  // Notification preference states
  bool emailNotifications = true;
  bool smsNotifications = false;
  bool appNotifications = true;

  // Two-Factor Authentication state
  bool twoFactorEnabled = false;

  // Editable fields for User Profile
  String name = "Naomi Malingumu";
  String email = "malingumunaomi@gmail.com";
  String phone = "+255 758 105 575";

  // Preferred genres
  List<String> preferredGenres = ['Fiction', 'Science', 'History'];
  List<String> availableGenres = [
    'Fiction', 'Non-fiction', 'Science', 'History', 'Fantasy', 'Biography'
  ];

  // Preferred reading formats
  bool prefersEbooks = true;
  bool prefersAudiobooks = false;
  bool prefersPDFs = true;

  // Language Preferences
  List<String> preferredLanguages = ['English'];
  List<String> availableLanguages = [
    'English', 'Spanish', 'French', 'German', 'Chinese'
  ];

  // Font and display settings
  bool darkModeEnabled = false;

  // Privacy Settings
  bool locationTrackingEnabled = true;
  bool personalizedAdsEnabled = true;
  bool cookiesEnabled = true;
  bool cameraPermissionEnabled = false;
  bool microphonePermissionEnabled = false;
  bool locationPermissionEnabled = true;
  bool privateBrowsingEnabled = false;
  bool readingHistoryEnabled = true;

  // Password visibility toggles
  bool _isCurrentPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Password controllers
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Helper function to show edit dialogs with cursor at the end of the text
  void _showEditDialog({
    required String title,
    required String initialValue,
    required Function(String) onSave,
  }) {
    final controller = TextEditingController(text: initialValue);
    controller.selection = TextSelection.fromPosition(TextPosition(offset: controller.text.length));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Enter new $title',
              hintText: 'Leave empty to delete',
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // User Profile Information
          ListTile(
            leading: const Icon(Icons.person_outline, color: chocolateColor),
            title: const Text(
              'User Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('Name: $name'),
                Text('Email: $email'),
                Text('Phone: $phone'),
              ],
            ),
            trailing: const Icon(Icons.edit, color: Colors.grey),
            onTap: () {
              _showEditUserProfileDialog();
            },
          ),
          const Divider(),

          // Account Settings
          ListTile(
            leading: const Icon(Icons.settings_outlined, color: chocolateColor),
            title: const Text(
              'Account Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Password Management
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0.0),
                  leading: const Icon(Icons.lock_outline, color: chocolateColor),
                  title: const Text('Password Management'),
                  onTap: () {
                    _showChangePasswordDialog();
                  },
                ),
                const Divider(),

                // Two-Factor Authentication
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0.0),
                  leading: const Icon(Icons.security_outlined, color: chocolateColor),
                  title: const Text('Two-Factor Authentication'),
                  trailing: Switch(
                    value: twoFactorEnabled,
                    onChanged: (value) {
                      setState(() {
                        twoFactorEnabled = value;
                      });
                    },
                  ),
                ),
                const Divider(),

                // Notification Preferences
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 0.0),
                  leading: const Icon(Icons.notifications_outlined, color: chocolateColor),
                  title: const Text('Notification Preferences'),
                  trailing: const Icon(Icons.edit, color: Colors.grey),
                  onTap: () {
                    _showNotificationPreferencesDialog();
                  },
                ),
              ],
            ),
          ),
          const Divider(),

          // Reading Preferences
          ListTile(
            leading: const Icon(Icons.book_outlined, color: chocolateColor),
            title: const Text(
              'Reading Preferences',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              _showReadingPreferencesDialog();
            },
          ),
          const Divider(),

          // Privacy Settings
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: chocolateColor),
            title: const Text(
              'Privacy Settings',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            trailing: const Icon(Icons.edit, color: Colors.grey),
            onTap: () {
              _showPrivacySettingsDialog();
            },
          ),
          const Divider(),
        ],
      ),
    );
  }

  // Function to show Notification Preferences dialog
  void _showNotificationPreferencesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification Preferences'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: const Text('Email Notifications'),
                    value: emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        emailNotifications = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('SMS Notifications'),
                    value: smsNotifications,
                    onChanged: (value) {
                      setState(() {
                        smsNotifications = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('App Notifications'),
                    value: appNotifications,
                    onChanged: (value) {
                      setState(() {
                        appNotifications = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show User Profile edit dialog
  void _showEditUserProfileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit User Profile'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              final nameController = TextEditingController(text: name);
              final emailController = TextEditingController(text: email);
              final phoneController = TextEditingController(text: phone);

              // Set cursor to the end of each text field
              nameController.selection = TextSelection.fromPosition(
                  TextPosition(offset: nameController.text.length));
              emailController.selection = TextSelection.fromPosition(
                  TextPosition(offset: emailController.text.length));
              phoneController.selection = TextSelection.fromPosition(
                  TextPosition(offset: phoneController.text.length));

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Name'),
                    controller: nameController,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Email'),
                    controller: emailController,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Phone'),
                    controller: phoneController,
                    onChanged: (value) {
                      setState(() {
                        phone = value;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {}); // Trigger UI update
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Function to show Reading Preferences dialog
  void _showReadingPreferencesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reading Preferences'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Genres
                  const Text(
                    'Preferred Genres:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    children: availableGenres.map((genre) {
                      return ChoiceChip(
                        label: Text(genre),
                        selected: preferredGenres.contains(genre),
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              preferredGenres.add(genre);
                            } else {
                              preferredGenres.remove(genre);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  const Divider(),

                  // Reading Formats
                  const Text(
                    'Preferred Formats:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  CheckboxListTile(
                    title: const Text('Ebooks'),
                    value: prefersEbooks,
                    onChanged: (value) {
                      setState(() {
                        prefersEbooks = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Audiobooks'),
                    value: prefersAudiobooks,
                    onChanged: (value) {
                      setState(() {
                        prefersAudiobooks = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('PDFs'),
                    value: prefersPDFs,
                    onChanged: (value) {
                      setState(() {
                        prefersPDFs = value!;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show Privacy Settings dialog
  void _showPrivacySettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Privacy Settings'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // App Permissions
                  const Text(
                    'App Permissions:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SwitchListTile(
                    title: const Text('Camera Access'),
                    value: cameraPermissionEnabled,
                    onChanged: (value) {
                      setState(() {
                        cameraPermissionEnabled = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Microphone Access'),
                    value: microphonePermissionEnabled,
                    onChanged: (value) {
                      setState(() {
                        microphonePermissionEnabled = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Location Access'),
                    value: locationPermissionEnabled,
                    onChanged: (value) {
                      setState(() {
                        locationPermissionEnabled = value;
                      });
                    },
                  ),
                  const Divider(),

                  // Private Browsing and Reading History
                  const Text(
                    'Privacy Controls:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SwitchListTile(
                    title: const Text('Private Browsing'),
                    value: privateBrowsingEnabled,
                    onChanged: (value) {
                      setState(() {
                        privateBrowsingEnabled = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Reading History Enabled'),
                    value: readingHistoryEnabled,
                    onChanged: (value) {
                      setState(() {
                        readingHistoryEnabled = value;
                      });
                    },
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show password change dialog
  void _showChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change Password'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _currentPasswordController,
                    obscureText: !_isCurrentPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Current Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isCurrentPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isCurrentPasswordVisible = !_isCurrentPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: _newPasswordController,
                    obscureText: !_isNewPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isNewPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isNewPasswordVisible = !_isNewPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: !_isConfirmPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
